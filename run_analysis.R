#-------------------------------------------------------------------------------
# This run_analysis.R script was created under the assumption that the UCI HAR
# Dataset has been manually downloaded and extracted from the following url:
#
# "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
#
# The script also operated under the assumption that the dataset was extracted
# to the current working directory
#-------------------------------------------------------------------------------

#-------------------------------------------------------------------------------
# This script, according to assignment instructions, does the following in no 
# specific order:
# 
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each 
#     measurement.
# 3. Uses descriptive activity names to name the activities in the data set.
# 4. Appropriately labels the data set with descriptive variable names.
# 5. From the data set in step 4,creates a second, independent tidy data set
#     with the average of each variable for each activity and each subject. 
#-------------------------------------------------------------------------------

# /Step 0/----------------------------------------------------------------------
#   load main datasets, labels, and call libraries

library(dplyr)

test <- read.table("./UCI HAR Dataset/test/X_test.txt")
train <- read.table("./UCI HAR Dataset/train/X_train.txt")

features <- read.table("./UCI HAR Dataset/features.txt", colClasses="character")

#   clean feature names

featurevector <- features$V2
featurevector <- tolower(featurevector)
featurevector <- gsub("\\()", "", featurevector) #\\ indicates () characters rather than expression
featurevector <- gsub("-", "", featurevector)

#   label datasets with feature names

names(test) <- featurevector
names(train) <- featurevector
rm(features, featurevector)

# /Step 1/ ---------------------------------------------------------------------
#   extract mean and sd & replace dataset with those columns

test_mean <- grep("mean", names(test))
test_std <- grep("std", names(test))

test <- test[, c(test_mean, test_std)]
test <- select(test, -(grep("angle", names(test))))

train_mean <- grep("mean", names(train))
train_std <- grep("std", names(train))

train <- train[, c(train_mean, train_std)]
train <- select(train, -(grep("angle", names(train))))

rm(test_mean, test_std, train_mean, train_std)

# /Step 2/ -------------------------------------------------------------------
#   add descriptive labels for the activities 

#   load activity labels & assign from table

activities <- read.table("./UCI HAR Dataset/activity_labels.txt", col.names=c("code", "activity"))
test_activities <- read.table("./UCI HAR Dataset/test/y_test.txt")
train_activities <- read.table("./UCI HAR Dataset/train/y_train.txt")

test_activities$V1 <- activities[test_activities$V1, 2]
train_activities$V1 <- activities[train_activities$V1, 2]

names(test_activities) <- "activitylabel"
names(train_activities) <- "activitylabel"

test <- cbind(test, test_activities)
train <- cbind(train, train_activities)


rm(train_activities, test_activities, activities)

#   add subject column to both datasets & merge with main datasets

test_subject <- read.table("./UCI HAR Dataset/test/subject_test.txt", col.names=c("subject"))
train_subject <- read.table("./UCI HAR Dataset/train/subject_train.txt", col.names=c("subject"))

test <- cbind(test, test_subject)
train <- cbind(train, train_subject)

rm(train_subject, test_subject)

# /Step 3/----------------------------------------------------------------------
#   Merge test & train datasets

final_data <- rbind(test, train)

rm(test, train)

# /Step 4/----------------------------------------------------------------------
#   make second tidy dataset with variables averaged, grouped by subject & activity

tidy_data <- final_data %>%
              group_by(activitylabel, subject) %>%
              summarise_each(funs(mean))

write.table(tidy_data, "./tidydata.txt", row.names=F)













