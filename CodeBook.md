# Codebook for JHU Getting and Cleaning Data Course Project
## David Lee
## 9 November 2020

## Project Description
This is a peer-graded assignment of Johns Hopkins University's Data Science course "Getting and Cleaning Data" on Coursera.  
The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. 
The goal is to prepare tidy data that can be used for later analysis.
  
  
## Study design and data processing

### Source
The data linked to from the course website represent data collected from the accelerometers from Samsung Galaxy S smartphones.  
Human Activity Recognition Using Smartphones Data Set: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
 
  
### Collection of the raw data
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.
  
The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.
 
 
## Creating the tidy data file

### Guide to create the tidy data file
1. Download the data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
1. Unzip *"getdata_projectfiles_UCI HAR Dataset.zip"* into the working directory
1. Run cleaning script *"run_analysis.R"*
1. *"tidy_data_mean.txt"* has been created in the working directory
 
 
### Cleaning of the data
Cleaning script *"run_analysis.R"* performs the following:

* Step 1: Merge the training and the test sets to create a single data set.
* Step 2: Extract only the measurements on the mean and standard deviation for each measurement.
* Step 3: Use descriptive activity names to name the activities in the data set.
* Step 4: Label the data set with descriptive variable names.
* Step 5: From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.

For more details, refer to [README.md](README.md).
 
 
## Description of the variables in the tidy data file

### Dimensions of Dataset
* 180 observations
* 68 variables
 
 
### Summary of Data
The data set contains average of each variable for each activity and each subject listed below.
 
 
### Variables

S/N | Variable | Class | Levels | Raw Variable Name
------------ | ------------ | ------------- | ------------- | -------------
1 | subject | int | 1 to 30 | NA
2 | activity | chr | WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING | NA
3 | time_body_accelerometer_mean_x | num | Within -1 to 1 | tBodyAcc-mean()-X
4 | time_body_accelerometer_mean_y | num | Within -1 to 1 | tBodyAcc-mean()-Y
5 | time_body_accelerometer_mean_z | num | Within -1 to 1 | tBodyAcc-mean()-Z
6 | time_gravity_accelerometer_mean_x | num | Within -1 to 1 | tGravityAcc-mean()-X
7 | time_gravity_accelerometer_mean_y | num | Within -1 to 1 | tGravityAcc-mean()-Y
8 | time_gravity_accelerometer_mean_z | num | Within -1 to 1 | tGravityAcc-mean()-Z
9 | time_body_accelerometer_jerk_mean_x | num | Within -1 to 1 | tBodyAccJerk-mean()-X
10 | time_body_accelerometer_jerk_mean_y | num | Within -1 to 1 | tBodyAccJerk-mean()-Y
11 | time_body_accelerometer_jerk_mean_z | num | Within -1 to 1 | tBodyAccJerk-mean()-Z
12 | time_body_gyroscope_mean_x | num | Within -1 to 1 | tBodyGyro-mean()-X
13 | time_body_gyroscope_mean_y | num | Within -1 to 1 | tBodyGyro-mean()-Y
14 | time_body_gyroscope_mean_z | num | Within -1 to 1 | tBodyGyro-mean()-Z
15 | time_body_gyroscope_jerk_mean_x | num | Within -1 to 1 | tBodyGyroJerk-mean()-X
16 | time_body_gyroscope_jerk_mean_y | num | Within -1 to 1 | tBodyGyroJerk-mean()-Y
17 | time_body_gyroscope_jerk_mean_z | num | Within -1 to 1 | tBodyGyroJerk-mean()-Z
18 | time_body_accelerometer_magnitude_mean | num | Within -1 to 1 | tBodyAccMag-mean()
19 | time_gravity_accelerometer_magnitude_mean | num | Within -1 to 1 | tGravityAccMag-mean()
20 | time_body_accelerometer_jerk_magnitude_mean | num | Within -1 to 1 | tBodyAccJerkMag-mean()
21 | time_body_gyroscope_magnitude_mean | num | Within -1 to 1 | tBodyGyroMag-mean()
22 | time_body_gyroscope_jerk_magnitude_mean | num | Within -1 to 1 | tBodyGyroJerkMag-mean()
23 | frequency_body_accelerometer_mean_x | num | Within -1 to 1 | fBodyAcc-mean()-X
24 | frequency_body_accelerometer_mean_y | num | Within -1 to 1 | fBodyAcc-mean()-Y
25 | frequency_body_accelerometer_mean_z | num | Within -1 to 1 | fBodyAcc-mean()-Z
26 | frequency_body_accelerometer_jerk_mean_x | num | Within -1 to 1 | fBodyAccJerk-mean()-X
27 | frequency_body_accelerometer_jerk_mean_y | num | Within -1 to 1 | fBodyAccJerk-mean()-Y
28 | frequency_body_accelerometer_jerk_mean_z | num | Within -1 to 1 | fBodyAccJerk-mean()-Z
29 | frequency_body_gyroscope_mean_x | num | Within -1 to 1 | fBodyGyro-mean()-X
30 | frequency_body_gyroscope_mean_y | num | Within -1 to 1 | fBodyGyro-mean()-Y
31 | frequency_body_gyroscope_mean_z | num | Within -1 to 1 | fBodyGyro-mean()-Z
32 | frequency_body_accelerometer_magnitude_mean | num | Within -1 to 1 | fBodyAccMag-mean()
33 | frequency_body_accelerometer_jerk_magnitude_mean| num | Within -1 to 1 | fBodyBodyAccJerkMag-mean()
34 | frequency_body_gyroscope_magnitude_mean | num | Within -1 to 1 | fBodyBodyGyroMag-mean()
35 | frequency_body_gyroscope_jerk_magnitude_mean | num | Within -1 to 1 | fBodyBodyGyroJerkMag-mean()
36 | time_body_accelerometer_std_x | num | Within -1 to 1 | tBodyAcc-std()-X
37 | time_body_accelerometer_std_y | num | Within -1 to 1 | tBodyAcc-std()-Y
38 | time_body_accelerometer_std_z | num | Within -1 to 1 | tBodyAcc-std()-Z
39 | time_gravity_accelerometer_std_x | num | Within -1 to 1 | tGravityAcc-std()-X
40 | time_gravity_accelerometer_std_y | num | Within -1 to 1 | tGravityAcc-std()-Y
41 | time_gravity_accelerometer_std_z | num | Within -1 to 1 | tGravityAcc-std()-Z
42 | time_body_accelerometer_jerk_std_x | num | Within -1 to 1 | tBodyAccJerk-std()-X
43 | time_body_accelerometer_jerk_std_y | num | Within -1 to 1 | tBodyAccJerk-std()-Y
44 | time_body_accelerometer_jerk_std_z | num | Within -1 to 1 | tBodyAccJerk-std()-Z
45 | time_body_gyroscope_std_x | num | Within -1 to 1 | tBodyGyro-std()-X
46 | time_body_gyroscope_std_y | num | Within -1 to 1 | tBodyGyro-std()-Y
47 | time_body_gyroscope_std_z | num | Within -1 to 1 | tBodyGyro-std()-Z
48 | time_body_gyroscope_jerk_std_x | num | Within -1 to 1 | tBodyGyroJerk-std()-X
49 | time_body_gyroscope_jerk_std_y | num | Within -1 to 1 | tBodyGyroJerk-std()-Y
50 | time_body_gyroscope_jerk_std_z | num | Within -1 to 1 | tBodyGyroJerk-std()-Z
51 | time_body_accelerometer_magnitude_std | num | Within -1 to 1 | tBodyAccMag-std()
52 | time_gravity_accelerometer_magnitude_std | num | Within -1 to 1 | tGravityAccMag-std()
53 | time_body_accelerometer_jerk_magnitude_std | num | Within -1 to 1 | tBodyAccJerkMag-std()
54 | time_body_gyroscope_magnitude_std | num | Within -1 to 1 | tBodyGyroMag-std()
55 | time_body_gyroscope_jerk_magnitude_std | num | Within -1 to 1 | tBodyGyroJerkMag-std()
56 | frequency_body_accelerometer_std_x | num | Within -1 to 1 | fBodyAcc-std()-X
57 | frequency_body_accelerometer_std_y | num | Within -1 to 1 | fBodyAcc-std()-Y
58 | frequency_body_accelerometer_std_z | num | Within -1 to 1 | fBodyAcc-std()-Z
59 | frequency_body_accelerometer_jerk_std_x | num | Within -1 to 1 | fBodyAccJerk-std()-X
60 | frequency_body_accelerometer_jerk_std_y | num | Within -1 to 1 | fBodyAccJerk-std()-Y
61 | frequency_body_accelerometer_jerk_std_z | num | Within -1 to 1 | fBodyAccJerk-std()-Z
62 | frequency_body_gyroscope_std_x | num | Within -1 to 1 | fBodyGyro-std()-X
63 | frequency_body_gyroscope_std_y | num | Within -1 to 1 | fBodyGyro-std()-Y
64 | frequency_body_gyroscope_std_z | num | Within -1 to 1 | fBodyGyro-std()-Z
65 | frequency_body_accelerometer_magnitude_std | num | Within -1 to 1 | fBodyAccMag-std()
66 | frequency_body_accelerometer_jerk_magnitude_std | num | Within -1 to 1 | fBodyBodyAccJerkMag-std()
67 | frequency_body_gyroscope_magnitude_std | num | Within -1 to 1 | fBodyBodyGyroMag-std()
68 | frequency_body_gyroscope_jerk_magnitude_std | num | Within -1 to 1 | fBodyBodyGyroJerkMag-std()
