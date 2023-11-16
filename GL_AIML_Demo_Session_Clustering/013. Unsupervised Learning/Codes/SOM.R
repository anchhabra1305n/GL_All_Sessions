/************** Application of Kohenen's SOM ******************/
# Scope:
# Scope
# Self-Organizing Maps(SOM) are widely used for customer and gene clustering. Solutions in R are not very accessible due to lack of documentation and inefficient clustering methods that do not lead to connected clusters on the SOM. We will try to develop a generic method that allows clustering of any dataset with contineous and categorical variables and results in connected clusters on the SOM.

# Background
# Self organizing maps area great way to organize your multidimensional dataset in a two dimensional space using a neural network.
# 
# The concept on how that works is best explained in those two videos
# 
# Video 1
# video 2
# A difficulty with clustering methods relying on a distance matrix ist that it is very memory instensive. A dataset with 50k observations lie the diamond dataset will result in a 50kx50k distance matrix. The R packages implementing SOMs do not use distance matrixes even though using the same distance measures and thus can also cluster large datasets.


install.packages('kohonen')
library(kohonen)
require(kohonen)
require(tidyverse)
install.packages('magrittr')
library(magrittr)
require(magrittr)

library(RColorBrewer)
n <- 60
qual_col_pals = brewer.pal.info[brewer.pal.info$category == 'qual',]
col_vector = unlist(mapply(brewer.pal, qual_col_pals$maxcolors, rownames(qual_col_pals)))

data = diamonds 
map_dimension = 20
n_iterations = 1000
recalculate_map = T
recalculate_no_clusters = T

# Data Preparation
numerics = summarise_all( data, is.numeric ) %>%
  as.logical()

factors = names(data)%>%
.[!numerics]

numerics = names(data)%>%
.[numerics]



data_list = list()
distances = vector()

for (fac in factors){

data_list[[fac]] = kohonen::classvec2classmat( data[[fac]] )

distances = c(distances, 'tanimoto')

}

data_list[['numerics']] = scale(data[,numerics])
distances = c( distances, 'euclidean')

str(data_list)

names(data_list)
distances

# SOM - Application
# create a grid onto which the som will be mapped
# we might want to change map dimension in future versions

som_grid = kohonen::somgrid(xdim = map_dimension
                            , ydim=map_dimension
                            , topo="hexagonal")



if(recalculate_map == F & file.exists('som.Rdata') == T){
  
  load('som.Rdata')
  
} else{

  m = kohonen::supersom( data_list
                   , grid=som_grid
                   , rlen= n_iterations
                   , alpha = 0.05
                   , whatmap = c(factors, 'numerics')
                   , dist.fcts = distances
                   #, user.weights = weight_layers
                   #, maxNA.fraction = .5
                    )

  save(m, file = 'som.Rdata')
  
}

plot(m, type="changes")
plot(m, type="counts")
plot(m, type="dist.neighbours")
plot(m, type="codes")
plot(m, type="quality")

# Application of Hierarchical Clustering using Connectivity Constraints
# In order to implement connectivity constrains we have to factor in the distance of each cluster to another cluster on the SOM map. Clacluating distances on a hexagonal map is not trivial, so it comes in handy that the kohonen package provides such a function.  kohonen::unit.distances takes a som grid and returns a distance matrix reflecting the positional distance among clusters on the som grid.
# 
# In a second step we will multiply the higher dimensional distance matrix determined by the variables in the data set with the positional distance matrix on the grid and use the resulting. Note that we do not perform an acutal mathematical matrix multiplication but are just multiplying corressponding values on two matrices.

# fuse all layers into one dataframe
codes = tibble( layers = names(m$codes)
,codes = m$codes ) %>%
mutate( codes = purrr::map(codes, as_tibble) ) %>%
spread( key = layers, value = codes) %>%
apply(1, bind_cols) %>%
.[[1]] %>%
as_tibble()

# generate distance matrix for codes
dist_m = dist(codes) %>%
as.matrix()

# generate seperate distance matrix for map location

dist_on_map = kohonen::unit.distances(som_grid)


#exponentiate euclidean distance by distance on map
dist_adj = dist_m ^ dist_on_map

# Determine the Optimal Number of cluster
# There are are plenty of methods to determine the optimal number of clusters, a few of them are explained by the makers of the factoextra package on their website, which also provides an excellent ressource related to clustering methods. We will graphically look at the ellbow, the silhouette and the gap statistics method and the perform an array of other indeces which return a single number as the optimal number of clusters and have them cast a vote. For the latter we will use Nbclust::Nbclust()
# 
# In my preruns I subjectively find that the ward.D2 methods seems to deliver the best clustering results on a som map trained with the diamonds data set we will therefore start with this method.

install.packages('factoextra')
library(factoextra)

#ellbow method
factoextra::fviz_nbclust(dist_adj
                         , factoextra::hcut
                         , method = "wss"
                         , hc_method = 'ward.D2'
                         , k.max = 15)

#silhouette method
factoextra::fviz_nbclust(dist_adj
, factoextra::hcut
, method = "silhouette"
, hc_method = "ward.D2"
, k.max =  15)

#gap statistic
set.seed(123)
gap_stat = cluster::clusGap(dist_adj
, FUN = factoextra::hcut
, K.max = 15
, B = 50
, hc_method = "ward.D2")

factoextra::fviz_gap_stat(gap_stat)

# not all of the indexes always work with all distance matrices, especially ours which has been manipulated and represents a mix of numerical and categorical data we therefore will loop through all available indeces and catch all errors.

#hubert and dindex have been removed from list, becuase those are graphical methods
#gap and silhoutte have been removed as well since they are being plotted anyways
indexes = c( "kl", "ch", "hartigan", "ccc", "scott", "marriot", "trcovw", "tracew", "friedman", "rubin", "cindex", "db", "duda", "pseudot2", "beale", "ratkowsky", "ball", "ptbiserial", "frey", "mcclain", "gamma", "gplus", "tau", "dunn", "sdindex",  "sdbw")

if(recalculate_no_clusters == F & file.exists('nbclust.Rdata') == T ){

load('nbclust.Rdata')

}else{

results_nb = list()

safe_nb = purrr::safely(NbClust::NbClust)

# we will time the execution time of each step
times = list()

for(i in 1:length(indexes) ){

t = lubridate::now()

nb = safe_nb(as.dist(dist_adj)
, distance = "euclidean"
, min.nc = 2              
, max.nc = 15             
, method = "ward.D2"
, index = indexes[i]
)

results_nb[[i]] = nb

times[[i]]      = lubridate::now()-t

#print(indexes[i]) 
#print(nb$result$Best.nc)

}

df_clust = tibble( indexes = indexes
, times = times
, nb = results_nb) %>%
mutate( results = purrr::map(nb,'result') 
, error = purrr::map(nb, 'error')
, is_ok = purrr::map_lgl(error, is_null))

df_clust_success = df_clust %>%
filter( is_ok ) %>%
mutate( names      = purrr::map(results, names)
,all_index = purrr::map(results, 'All.index')
,best_nc   = purrr::map(results, 'Best.nc')
,best_nc   = purrr::map(best_nc, function(x) x[[1]])
,is_ok     = !purrr::map_lgl(best_nc, is_null)
) %>%
filter(is_ok) %>%
mutate( best_nc    = purrr::flatten_dbl(best_nc))

save(df_clust_success, file = 'nbclust.Rdata')
}

df_clust_success %>%
  filter(!is_null(best_nc) )%>%
ggplot( aes(x = as.factor(best_nc))) +
  geom_bar()+
  labs(title = 'Votes on optimal number of clusters\nVotes from Gap and Silhouete\nnot considered'
       ,x     = 'Best No of Clusters')

# Hierarchical Clustering

dist_adj =  dist_m ^ dist_on_map

clust_adj = hclust(as.dist(dist_adj), 'ward.D2')


som_cluster_adj = cutree(clust_adj, 11)
plot(m, type="codes", main = "Clusters", bgcol = col_vector[som_cluster_adj], pchs = NA)


# We find that clustering will not always resolve in a perfectly neighboured clusters. A walkaround could be to manually assign a cluster to hexagons that seem a bit off. However for most downstream calculation this should be irrelevant.

# Cluster Summary

link = tibble( map_loc = names(som_cluster_adj) %>% as.integer()
               ,cluster = som_cluster_adj)

pred = tibble( map_loc = m$unit.classif) %>%
  left_join(link)

data_pred = data %>%
  bind_cols(pred)

# plot numericals absolute values

# d_plot = data_pred %>%
#   as_tibble() %>%
#   select( one_of(numerics), cluster ) %>%
#   gather(key = 'key', value = 'value', one_of(numerics) )
# 
# medians = d_plot %>%
#   group_by(key, cluster) %>%
#   summarize_all( median)
# 
# ggplot(d_plot, aes(x = as.factor(cluster)
#                    , y = value) ) +
#   geom_violin( aes( fill = as.factor(cluster)) ) +
#   geom_crossbar( data = medians
#                  , mapping = aes(x = as.factor(cluster)
#                                  ,ymin = value
#                                  ,ymax = value)) +
#   facet_wrap(~key
#              , scales = 'free_y'
#              , ncol = 1)+
#   labs(title = 'Absolute Values of\nnumeric variables'
#        ) 

# plot numericals scaled values

d_plot_scale = data %>%
select( one_of(numerics) ) %>%
scale(center = T) %>%
as_tibble() %>%
bind_cols(pred) %>%
gather(key = 'key', value = 'value', one_of(numerics) )

medians = d_plot_scale %>%
group_by(key, cluster) %>%
summarize_all( median)


ggplot(medians, aes(x = as.factor(key)
, y = value) ) +
geom_bar( aes( fill = as.factor(key))
,stat = 'identity') +
geom_hline(yintercept = 0
,size = 1) +
facet_wrap(~cluster
, ncol = 1
) +
labs(title = 'Median values of scaled and centered\nnumeric variables')


# categoricals--------------------------------------------------------

d_plot = data_pred %>%
as_tibble() %>%
select( one_of(factors), cluster ) %>%
gather(key = 'key', value = 'value', one_of(factors) )

# to preserve factor order we have to add a sorting column

d_order = data_pred %>%
as_tibble() %>%
select( one_of(factors), cluster ) %>%
mutate_all( as.integer ) %>%
gather(key = 'key', value = 'order', one_of(factors) ) %>%
mutate( order = stringr::str_c(key, order))

d_plot = d_plot %>%
bind_cols( select(d_order, order) )%>%
arrange( order ) %>%
# we have to convert value to factor here
# ggplot will mess up the order if some 
# facet groups dont have all levels()
mutate( value = forcats::as_factor(value))

ggplot(d_plot ) +
geom_bar( aes( x = forcats::as_factor(value)
, y = ..prop..
, fill = key
, group = key)
)+
facet_wrap(~ cluster
,ncol = 1)+
labs(title = 'Percentages for each level of each factor level\n of each cluster',
fill = 'factors')+
theme(axis.text.x = element_text(angle = 90))

ggplot(data_pred, aes(x = as.factor(cluster)
                      , fill = as.factor(cluster))
       ) +
  geom_bar(show.legend = F)

# Does the clustering resolve into decision tree like clutering rules?
install.packages("rpart")
require(rpart)
library(rpart)
data_pred_tree = data_pred

data_pred_tree$cluster = as.factor(data_pred_tree$cluster)

m_tree = rpart::rpart(cluster~.-map_loc
                      , data_pred_tree
                      , maxdepth = 30)

rpart.plot::prp(m_tree
                  , branch.type   = 5
                  , box.palette   ="RdYlGn"
                  , faclen        = 0
                  , extra         = 6
                  , fallen.leaves = T
                  , tweak         = 2
                  #, gap           = input$gap
                  #, space         = input$space
                  )

# add node numbers to data
data_pred_tree$node = m_tree$where

# predicted class for each node
m_tree$frame$node = 1:nrow(m_tree$frame) 

data_pred_tree =  data_pred_tree %>%
left_join( select(m_tree$frame,node, yval) )%>%
mutate( pred_true = ifelse( yval == cluster, 1,0))


data_sum = data_pred_tree %>%
  group_by(node,yval)%>%
summarise( prop = sum(pred_true)/n()
,n   = n() )
data_sum
View(data_sum)

data_sum = data_pred_tree %>%
  summarise( prop = sum(pred_true)/n()
,n   = n() ) 
data_sum

# We can resolve the clusters derived from the SOM map fairly decently to a set of clustering rules. It however seems that the clustering broders are not a 100% sharp and that there seems to be some fuzzyness regarding towards which location on a map a particular neuron (observation) migrates to.


















