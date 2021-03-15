
Coursera - Getting and Cleaning Data Week 4 Assignment

The run_analysis.R script loads the relevant raw data form the UCI HAR Dataset, 
cleans and merges the data, and forms a final tidy dataset following the 
assignment guidelines for the Week 4 Getting and Cleaning Data Assignment.

Step 0.   The run_analysis.R script assumes that the user has manually 
          downloaded and extracted the raw UCI HAR Dataset to their current 
          working directory. Under this assumption, Step 0 in the script loads 
          the main datasets, test and train, as well as the column labels of the
          two main datasets. Step 0 also does some preliminary cleaning and 
          labelling by removing unnecessary characters in the feature strings and 
          converting the feature labels to lower case before assigning them to 
          the columns of test and train. Step 0 also calls for the dplyr library 
          as required for further steps in the data transformation process.
    
Step 1.   Extracts the mean and standard deviation from the labelled test and 
          train datasets using the grep function to parse the column names for
          mean and std character strings as indicated in the 
          /UCI HAR Dataset/features.txt file.
          
Step 2.   Loads the activities data, /UCI HAR Dataset/train/y_train.txt and 
          /UCI HAR Dataset/test/y_test.txt as well as the activity labels in the
          /UCI HAR Dataset/activity_labels.txt file. Step 2 then names the
          activities in the y_test.txt and y_train.txt files according to the
          corresponding numbers designated in the acvtivty_labels.txt file. 
          Using cbind() step 2 then merges the named activities with the main 
          test and train datasets. Finally, Step 2 loads the subject data 
          /UCI HAR Dataset/test/subject_test.txt and 
          /UCI HAR Dataset/train/subject_train.txt and
          merges it with the main test and train datasets, again using the 
          cbind()function.
          
Step 3.   Merges the main test and train dataset into a preliminary final_data
          object, using the rbind() function.
          
Step 4.   Using the group_by() and summarise_each() functions, Step 4 generates 
          the tidy_data object, which contains the average results for each
          subject in each activity. The tidy_data is then wrote to the 
          tidydata.txt file using the write.table() function.










