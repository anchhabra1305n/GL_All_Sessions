**1.Build ML Model - Random Foreast GRID SEARCH**
   
     1. Generate sample 1000 churn data
     2. Data preprocessing- EDA
     3. Model Building
     4. Mlflow auto log - Log the best model and log parameters under run id for each run on 1 particular environment
     
**2.Build streamlit app**

    1. Building steamlit front-end app to perform model monitoring or churn data prediction
    2. Model monitoring: with current data (X, Y), we can run the best model which we build on historical data and logged on mlflow on current data and compare performance metrics b/w historical data and current data
    3. Churn prediction: for future data (X), we can predict Y
    
**3. Docker Image**

    1. build docker image which calls streamlit app and run
    
**4. Create CI/CD actions in Git which run docker image and explain steps** 

**IMPROVISON:**

      Fetch the latest logged model mlflow under a particular environment instead of giving run_id of best-logged model in streamlit app
      for both model monitoring and churn prediction - DO EDA and Preprocessing before run best model 
