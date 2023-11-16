'''
# dependencies
# OS modules
import os
# Pandas
import pandas as pd
# In-built time module
import time
# tqdm for progress bars
from tqdm import tqdm
# Pillow Image Library
from PIL import Image
# Numpy module
import numpy as np

# A list for column names of csv
columnNames = list()

# iterate and build headers
for i in range(224*224*3):
    pixel = str(i)
    columnNames.append(pixel)

columnNames.append('label')
print("columnsNames  len = ",len(columnNames))
# Create a Pandas dataframe for storing data
train_data_2 = pd.DataFrame(columns = columnNames)# [str(i) for i in range(196*196*3)])

# calculates the total number of images in the dataset initially 0
num_images = 0

# iterate through every folder of the dataset
for i in class_names:

    # print messeage
    print("Iterating: " + str(i) + " folder")

    # itreate through every image in the folder
    # tqdm shows progress bar
    for j,file in enumerate(os.listdir(TRAIN_PATH+str(i))):
        # open image using PIL Image module
        if(j%100) == 0 :
            
            print(j," of ",len(os.listdir(os.path.join(TRAIN_PATH, str(i)))))
        img = cv2.imread(os.path.join(TRAIN_PATH,str(i), file))
        plt.imshow(img)
        # resize to 224x224, replace with your size
        #img = img.resize((192, 192), Image.NEAREST)
        img = cv2.resize(img, (224,224))
        ##print('img  shape = ',img.shape)
        # temporary array to store pixel values
        data = img.flatten()
        data = np.append(data,class_names.index(i))
        #data.append(img.flatten())
        ##print("len_data= ",len(data))
        # add the data row to training data dataframe
        train_data_2.loc[num_images] = data #np.insert(img.flatten(),class_names.index(i),0) #img.flatten()
    
        # increment the number of images
        num_images += 1
    #print(train_data_2.iloc[num_images-1,:])

# write the dataframe to the CSV file
train_data_2.to_csv("train_converted.csv", index=False)