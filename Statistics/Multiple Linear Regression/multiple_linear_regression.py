# Multiple Linear Regression

# Importing the libraries
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

# Importing the dataset
dataset = pd.read_csv('50_Startups.csv')
X = dataset.iloc[:, :-1] #take all the dataset except the last column (Profit) ---> take all independent features
y = dataset.iloc[:, 4] ---> #dependent variable is at index 4

#Convert the column into categorical columns

states=pd.get_dummies(X['State'],drop_first=True) #get_dummies is for one-hot encoding--->create a feature wrt to the categories (NY,C,F)
                              #drop_first=True --->Dummy variable trap--->when California is encoded as 1,Florida and NY are encoded as 00, to avoid having 3 columns of encoded data---> we remove the California column (first_column by default)

# Drop the state coulmn
X=X.drop('State',axis=1) #we do not require the State column now

# concat the dummy variables
X=pd.concat([X,states],axis=1) #add the Florida and NY to X



# Splitting the dataset into the Training set and Test set
from sklearn.model_selection import train_test_split
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size = 0.2, random_state = 0)

# Fitting Multiple Linear Regression to the Training set
from sklearn.linear_model import LinearRegression #--->use LR even for Multiple Linear Regression
regressor = LinearRegression()
regressor.fit(X_train, y_train) # modelwise ---> fit on train data only

# Predicting the Test set results
y_pred = regressor.predict(X_test) # modelwise ---> predict is only on test data

from sklearn.metrics import r2_score
score=r2_score(y_test,y_pred)