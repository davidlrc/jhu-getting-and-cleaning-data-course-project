# README for JHU Getting and Cleaning Data Course Project
## David Lee
## 9 November 2020

## Project Description
This is a peer-graded assignment of Johns Hopkins University's Data Science course "Getting and Cleaning Data" on Coursera.\
The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. 
The goal is to prepare tidy data that can be used for later analysis.
 
 
## Dataset
Human Activity Recognition Using Smartphones Data Set: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
 
 
## Files
* **CodeBook.md** is a code book that describes the variables, the data, and any transformations or work that performed to clean up the data.

* **run_analysis.R** performs data preparation and the following steps:
    * Step 1: Merge the training and the test sets to create a single data set.
    * Step 2: Extract only the measurements on the mean and standard deviation for each measurement.
    * Step 3: Use descriptive activity names to name the activities in the data set.
    * Step 4: Label the data set with descriptive variable names.
    * Step 5: From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.

* **tidy_data_mean.txt** contains the tidy data set after going through data cleaning.
  
  
## Description of run_analysis.R

### Perequisites
* The *[Human Activity Recognition Using Smartphones Data Set](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)* has been downloaded and all files have been extracted to the working directory.
* The extracted files reside in *"UCI HAR Dataset"* folder.


### Libraries
1. **data.table** is efficient in handling large data as tables.
1. **dplyr** is used to perform dataframe manipulation to create the tidy data.

    ```
    library(data.table)
    library(dplyr)
    ```
  
  
### Preparation: Load and assign data sets.
After analysing the requirements, the following files are identified as required:

1. **features.txt**: list of features
1. **activity_labels.txt**: links the class labels with their activity name
1. **subject_train.txt**: each row identifies the subject who performed the activity for each window sample.
1. **X_train.txt**: training set.
1. **y_train.txt**: training labels.
1. **subject_test.txt**: each row identifies the subject who performed the activity for each window sample.
1. **X_test.txt**: test set.
1. **y_test.txt**: test labels.

Data is read from each file and assigned to individual ```data.table```. New column names are assigned for readability.
\
\
`features`
```
features <- fread("UCI HAR Dataset/features.txt", col.names = c("sn", "feature"))
dim(features)
[1] 561   2
```
\
`activity_labels`
```
activity_labels <- fread("UCI HAR Dataset/activity_labels.txt", col.names = c("label", "activity"))
dim(activity_labels)
[1] 6 2
                         
```
\
`subject_train`
```
subject_train <- fread("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
dim(subject_train)
[1] 7352    1
```
\
`training_set`
```
training_set <- fread("UCI HAR Dataset/train/X_train.txt", col.names = features$feature)
dim(training_set)
[1] 7352  561
```
\
`training_labels`
```
training_labels <- fread("UCI HAR Dataset/train/y_train.txt", col.names = "label")
dim(training_labels)
[1] 7352    1
```
\
`subject_test`
```
subject_test <- fread("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
dim(subject_test)
[1] 2947    1
```
\
`test_set`
```
test_set <- fread("UCI HAR Dataset/test/X_test.txt", col.names = features$feature)
dim(test_set)
[1] 2947  561
```
\
`test_labels`
```
test_labels <- fread("UCI HAR Dataset/test/y_test.txt", col.names = "label")
dim(test_labels)
[1] 2947    1
```
  
  
### Step 1: Merges the training and the test sets to create one data set.
Merge rows of `training_set` and `test_set` `data.table` to create `training_test_data`.
```
training_test_data <- rbind(training_set, test_set)
dim(training_test_data)
[1] 10299   561
```
\
Merge rows of `training_labels` and `test_labels` `data.table` to create `training_test_labels`.
```
training_test_labels <- rbind(training_labels, test_labels)
dim(training_test_labels)
[1] 10299     1
```
\
Merge rows of `subject_train` and `subject_test` `data.table` to create `subject_data`.
```
subject_data <- rbind(subject_train, subject_test)
dim(subject_data)
[1] 10299     1
```
\
Merge rows of `subject_data`, `training_test_labels` and `training_test_data` `data.table` to create `merged_data`.
```
merged_data <- cbind(subject_data, training_test_labels, training_test_data)
dim(merged_data)
[1] 10299   563
```
  
  
### Step 2: Extracts only the measurements on the mean and standard deviation for each measurement.
Extract only columns subject, label and those with name that contains either *"mean()"* (Mean) or *"value std()"* (Standard deviation) to a new `data.table` `tidy_data`.
```
tidy_data <- merged_data %>% 
    select(subject, label, contains("mean()"), contains("std()"))
dim(tidy_data)
[1] 10299    68
```
  
  
### Step 3: Uses descriptive activity names to name the activities in the data set.
Replace Label numbers in `code` column of the `tidy_data` with the corresponding activity text from second column of the `activity_labels` `data.table`.
```
tidy_data$label <- activity_labels[tidy_data$label, 2]
```
  
  
### Step 4: Appropriately labels the data set with descriptive variable names.
Rename `label` column to `activity`.
```
names(tidy_data)[2] = "activity"
```
\
Replace all short form occurrence of `Acc` in column names with their full version `Accelerometer`.
```
names(tidy_data) <- gsub("Acc", "Accelerometer", names(tidy_data))
```
\
Replace all short form occurrence of `Gyro` in column names with their full version `Gyroscope`.
```
names(tidy_data) <- gsub("Gyro", "Gyroscope", names(tidy_data))
```
\
Replace all short form occurrence of `Freq` in column names with their full version `Frequency`.
```
names(tidy_data) <- gsub("Freq", "Frequency", names(tidy_data))
```
\
Replace all short form occurrence of `Mag` in column names with their full version `Magnitude`.
```
names(tidy_data) <- gsub("Mag", "Magnitude", names(tidy_data))
```
\
Replace all short form occurrence of `tBody` in column names with their full version `TimeBody`.
```
names(tidy_data) <- gsub("tBody", "TimeBody", names(tidy_data))
```
\
Replace all short form occurrence of `t` only at the beginning of column names with their full version `Time`.
```
names(tidy_data) <- gsub("^t", "Time", names(tidy_data))
```
\
Replace all short form occurrence of `f` only at the beginning of column names with their full version `Frequency`.
```
names(tidy_data) <- gsub("^f", "Frequency", names(tidy_data))
```
\
Replace all small capitalised occurrence of `angle` in column names with their sentence case version `Angle`.
```
names(tidy_data) <- gsub("angle", "Angle", names(tidy_data))
```
\
Replace all small capitalised occurrence of `gravity` in column names with their sentence case version `Gravity`.
```
names(tidy_data) <- gsub("gravity", "Gravity", names(tidy_data))
```
\
Replace all double word occurrence of `BodyBody` in column names with a single `Body`.
```
names(tidy_data) <- gsub("BodyBody", "Body", names(tidy_data))
```
\
Replace all occurrence of `-mean()` in column names with `Mean`.
```
names(tidy_data) <- gsub("-mean()", "Mean", names(tidy_data), ignore.case = TRUE)
```
\
Replace all occurrence of `-std()` in column names with `StandardDeviation`.
```
names(tidy_data) <- gsub("-std()", "StandardDeviation", names(tidy_data), ignore.case = TRUE)
```
\
Replace all occurrence of `-freq()` in column names with `Frequency`.
```
names(tidy_data) <- gsub("-freq()", "Frequency", names(tidy_data), ignore.case = TRUE)
```
\
Replace all occurrence of `()` in column names with empty space (removed).
```
names(tidy_data) <- gsub("\\()", "", names(tidy_data))
```
\
Replace all occurrence of `-X` in column names with `X`.
```
names(tidy_data) <- gsub("-X", "X", names(tidy_data))
```
\
Replace all occurrence of `-Y` in column names with `Y`.
```
names(tidy_data) <- gsub("-Y", "Y", names(tidy_data))
```
\
Replace all occurrence of `-Z` in column names with `Z`.
```
names(tidy_data) <- gsub("-Z", "Z", names(tidy_data))
```
\
Replace all occurrence of lowercase letter or a number followed by an upper case letter with `_`.\
Convert all text to lowercase.
```
names(tidy_data) <- tolower(gsub("(?<=[a-z0-9])(?=[A-Z])", "_", names(tidy_data), perl = TRUE))
```
  
  
### Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
Group data in `tidy_data` by `subject` and `activity`, and sumarise all columns after applying the `mean` transformation to them, to create `tidy_data_mean` `data.frame`.
```
tidy_data_mean <- tidy_data %>%
    group_by(subject, activity) %>%
    summarise_all(list(mean))
dim(tidy_data_mean)
[1] 180  68
```
\
Write `tidy_data_mean` `data.frame` to text file `tidy_data_mean.txt`.
```
write.table(tidy_data_mean, "tidy_data_mean.txt", row.name = FALSE)
```
  
