This document describes the variables, data, and transformations performed to clean up the data.  The following tables are input files:

1. features.txt
2. activity_labels.txt
3. subject_train.txt
4. X_train.txt
5. y_train.txt
6. subject_test.txt
7. X_test.txt
8. y_test.txt

The run_analysis.R tool reads in the above files (when they are located in the working directory).  If files are not located, the code terminates with an error message.  Once all files are read, the following steps are performed: 

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. (Note that only variables that are 'mean' or 'std' are included and the 'meanFreq' variable is a mean of frequency components, not the variable itself).
3. Uses descriptive activity names to name the activities in the data set.  These labels are the exact ones found in activity_labels.txt
4. Appropriately labels the data set with descriptive variable names. These labels are the those found in features.txt with the parentheses stripped.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The output file is called data_summary_means.txt.  




Below, the variables in the input files are described:

y_train.txt and y_test.txt have data sets where the columns represent 561 features and the rows represent records (an activity performed by a subject).  The activity number performed in each row is listed in X_test.txt and X_train.txt, while the subject performing the activity is listed in subject_test.txt and subject_train.txt.  The column/feature names are listed in features.txt.  The description of each activity and its corresponding identifying number is listed in activity_labels.txt.  




Below, the output file is described:

This file has 68 columns:

1                subject_id
2                   activity
3            tBodyAcc-mean-X

4            tBodyAcc-mean-Y

5            tBodyAcc-mean-Z

6         tGravityAcc-mean-X

7         tGravityAcc-mean-Y

8         tGravityAcc-mean-Z

9        tBodyAccJerk-mean-X

10       tBodyAccJerk-mean-Y

11       tBodyAccJerk-mean-Z

12          tBodyGyro-mean-X

13          tBodyGyro-mean-Y

14          tBodyGyro-mean-Z

15      tBodyGyroJerk-mean-X

16      tBodyGyroJerk-mean-Y

17      tBodyGyroJerk-mean-Z

18          tBodyAccMag-mean

19       tGravityAccMag-mean

20      tBodyAccJerkMag-mean

21         tBodyGyroMag-mean

22     tBodyGyroJerkMag-mean

23           fBodyAcc-mean-X

24           fBodyAcc-mean-Y

25           fBodyAcc-mean-Z

26       fBodyAccJerk-mean-X

27       fBodyAccJerk-mean-Y

28       fBodyAccJerk-mean-Z

29          fBodyGyro-mean-X

30          fBodyGyro-mean-Y

31          fBodyGyro-mean-Z

32          fBodyAccMag-mean
33  fBodyBodyAccJerkMag-mean
34     fBodyBodyGyroMag-mean
35 fBodyBodyGyroJerkMag-mean
36            tBodyAcc-std-X
37            tBodyAcc-std-Y
38            tBodyAcc-std-Z
39         tGravityAcc-std-X
40         tGravityAcc-std-Y
41         tGravityAcc-std-Z
42        tBodyAccJerk-std-X
43        tBodyAccJerk-std-Y
44        tBodyAccJerk-std-Z
45           tBodyGyro-std-X
46           tBodyGyro-std-Y
47           tBodyGyro-std-Z
48       tBodyGyroJerk-std-X
49       tBodyGyroJerk-std-Y
50       tBodyGyroJerk-std-Z
51           tBodyAccMag-std
52        tGravityAccMag-std
53       tBodyAccJerkMag-std
54          tBodyGyroMag-std
55      tBodyGyroJerkMag-std
56            fBodyAcc-std-X
57            fBodyAcc-std-Y
58            fBodyAcc-std-Z
59        fBodyAccJerk-std-X
60        fBodyAccJerk-std-Y
61        fBodyAccJerk-std-Z
62           fBodyGyro-std-X
63           fBodyGyro-std-Y
64           fBodyGyro-std-Z
65           fBodyAccMag-std
66   fBodyBodyAccJerkMag-std
67      fBodyBodyGyroMag-std
68  fBodyBodyGyroJerkMag-std

Column 1:  subject_id has 30 values, numbered 1 through 30
Column 2:  activity uses the following 6 activities:  

1                      STANDING
2                       SITTING
3                        LAYING
4                       WALKING
5            WALKING_DOWNSTAIRS
6              WALKING_UPSTAIRS

The description of the following 66 columns is paraphrased from the features_info.txt file found here: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean: Mean value
std: Standard deviation

From these variables, the output file returns the average for each activity and subject.  

