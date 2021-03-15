
Coursera - Getting and Cleaning Data Week 4 Assignment

The following readme describes the contents of this github repository and the 
data transformation methodologies as required for completion of the Getting and
Cleaning Data Assignment on Coursera

The Online Course can be found at the following link:

https://www.coursera.org/learn/data-cleaning


Contents - Repository Files:

1. CodeBook.md:     This document provides descriptions of the variables in the 
                    tidy_data dataset
2. README.md:       Contains a description of the files in this GitHub 
                    repository and the transformations of the raw UCI HAR 
                    Dataset to generate the tidy_data dataset 
3. run_analysis.R:  Contains the R script used to transform the data
4. tidy_data.txt:   This is the tidy dataset produced as an output of 
                    run_analysis.R

  

The run_analysis.R script was created under the assumption that the UCI HAR
Dataset has been manually downloaded and extracted from the following url:

"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

The script also operates under the assumption that the dataset was extracted to 
the user's current working directory



The run_analysis script, according to assignment instructions, does the 
following in no specific order:

1.  Merges the training and the test sets to create one data set.
2.  Extracts only the measurements on the mean and standard deviation for each 
    measurement.
3.  Uses descriptive activity names to name the activities in the data set.
4.  Appropriately labels the data set with descriptive variable names.
5.  From the data set in step 4,creates a second, independent tidy data set
    with the average of each variable for each activity and each subject. 