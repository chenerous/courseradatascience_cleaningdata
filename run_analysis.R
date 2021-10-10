# Title:  run_analysis.R
#
# Desciption:  This code reads, cleans, and outputs tidy data using the UCI 
# Human Activity Recognition Using Smartphone Data Set.
#
# The data can be found here:
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  
#
# and more info can be found here:
# http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
#
# The steps this code performs:  
#
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each 
#    measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data set with 
#   the average of each variable for each activity and each subject.
#
# Note:
#  the code expects to find the input files in the working directory 
#  the dyplr package is required
######################################################################
#### library calls
library(dplyr)

#### reading data (several input files need to be read)
# read features.txt which has the ordered names of the variables
filename_features <- "../UCI HAR Dataset/features.txt"
if (file.exists(filename_features)){
  varnames <- read.table(filename_features)  
}else{
  stop("features.txt file not found")
}

# read activity_labels.txt which has the names of activities and IDs
filename_activities <- "../UCI HAR Dataset/activity_labels.txt"
if (file.exists(filename_activities)){
  activitynames <- read.table(filename_activities)  
}else{
  stop("activity_labels.txt file not found")
}

# read the training data
filename_subject_train <-"../UCI HAR Dataset/train/subject_train.txt" #lists subject ID of each record
filename_y_train<-"../UCI HAR Dataset/train/y_train.txt" #lists activity ID of each record
filename_X_train <- "../UCI HAR Dataset/train/X_train.txt" #recorded data (rows=records, columns=variables)
if (file.exists(filename_subject_train)){
subject_train <- read.table(filename_subject_train)
}else{
  stop("subject_train.txt file not found")
}
if (file.exists(filename_y_train)){
  activity_train <- read.table(filename_y_train) 
}else{
  stop("y_train.txt file not found")
}
if (file.exists(filename_X_train)){
  train_dat <- read.table(filename_X_train) 
}else{
  stop("X_train.txt file not found")
}

# read the test data
filename_subject_test <-"../UCI HAR Dataset/test/subject_test.txt" #lists subject ID of each record
filename_y_test<-"../UCI HAR Dataset/test/y_test.txt" #lists activity ID of each record
filename_X_test <- "../UCI HAR Dataset/test/X_test.txt" #recorded data (rows=records, columns=variables)
if (file.exists(filename_subject_test)){
  subject_test <- read.table(filename_subject_test)
}else{
  stop("subject_test.txt file not found")
}
if (file.exists(filename_y_test)){
  activity_test <- read.table(filename_y_test) 
}else{
  stop("y_test.txt file not found")
}
if (file.exists(filename_X_test)){
  test_dat <- read.table(filename_X_test) 
}else{
  stop("X_test.txt file not found")
}

#### Step 1:  Merging data 

# merge training and test sets
# first, let's create a merged version of the subject, activity, and recorded data:
# subject_dat, activity_dat, recorded_dat

subject_dat <- rbind(subject_train,subject_test)
activity_dat <- rbind(activity_train,activity_test)
recorded_dat <- rbind(train_dat,test_dat)

#### Step 2:  Extract only mean and standard deviation for each measurement

# note in this step, I only include variables that are 'mean' or 'std'
# I don't consider 'meanFreq' to be a mean of the variable 
# (it's a mean of frequency components, instead)

variables <- c(grep("mean\\(\\)",varnames$V2),grep("std\\(\\)",varnames$V2))
recorded_dat <- recorded_dat[,variables]

#### Step 3:  Create descriptive activity names 
## I used the activity names in activity labels file
activitynames_dat <- activitynames$V2[activity_dat$V1] 

#### Step 4:  Create descriptive variable names
## I used the variable names in the features file with the 
## parentheses stripped
variablenames_dat <- varnames$V2[variables]
variablenames_dat <- gsub("\\(\\)","",variablenames_dat)

### Put the recorded data, activities, and subjects into one data set
### and set column names 
combined_dat <- cbind(subject_dat,activitynames_dat,recorded_dat)
colnames <- c("subject_id","activity",variablenames_dat)
names(combined_dat) <- colnames

#### Step 5:  Create a second, independent tidy data set with the 
####          average of each variable for each activity and each subject

combined_dat %>% group_by(subject_id,activity) %>% summarise(across(everything(),list(mean)))

#### write output
write.table(combined_dat,"data_summary_means.txt",row.name=FALSE)

