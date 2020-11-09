library(data.table)
library(dplyr)

##
## Preparation: Load and assign data sets.
## As per assignment instructions, the Samsung data is stored in 
## "UCI HAR Dataset" folder instead of the usual "data" folder.
##
features <- fread("UCI HAR Dataset/features.txt", col.names = c("sn", "feature"))
dim(features)

activity_labels <- fread("UCI HAR Dataset/activity_labels.txt", 
                         col.names = c("label", "activity"))
dim(activity_labels)

subject_train <- fread("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
dim(subject_train)

training_set <- fread("UCI HAR Dataset/train/X_train.txt", 
                             col.names = features$feature)
dim(training_set)

training_labels <- fread("UCI HAR Dataset/train/y_train.txt", col.names = "label")
dim(training_labels)

subject_test <- fread("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
dim(subject_test)

test_set <- fread("UCI HAR Dataset/test/X_test.txt", col.names = features$feature)
dim(test_set)

test_labels <- fread("UCI HAR Dataset/test/y_test.txt", col.names = "label")
dim(test_labels)

## 
## Step 1: Merges the training and the test sets to create one data set.
## 
training_test_data <- rbind(training_set, test_set)
dim(training_test_data)

training_test_labels <- rbind(training_labels, test_labels)
dim(training_test_labels)

subject_data <- rbind(subject_train, subject_test)
dim(subject_data)

merged_data <- cbind(subject_data, training_test_labels, training_test_data)
dim(merged_data)

## 
## Step 2: Extracts only the measurements on the mean and standard deviation 
## for each measurement.
## 
tidy_data <- merged_data %>% 
    select(subject, label, contains("mean()"), contains("std()"))
dim(tidy_data)

## 
## Step 3: Uses descriptive activity names to name the activities in the data 
## set.
## 
tidy_data$label <- activity_labels[tidy_data$label, 2]

## 
## Step 4: Appropriately labels the data set with descriptive variable names.
## 
#names(tidy_data)
names(tidy_data)[2] = "activity"
names(tidy_data) <- gsub("Acc", "Accelerometer", names(tidy_data))
names(tidy_data) <- gsub("Gyro", "Gyroscope", names(tidy_data))
names(tidy_data) <- gsub("Freq", "Frequency", names(tidy_data))
names(tidy_data) <- gsub("Mag", "Magnitude", names(tidy_data))
names(tidy_data) <- gsub("tBody", "TimeBody", names(tidy_data))
names(tidy_data) <- gsub("^t", "Time", names(tidy_data))
names(tidy_data) <- gsub("^f", "Frequency", names(tidy_data))

names(tidy_data) <- gsub("angle", "Angle", names(tidy_data))
names(tidy_data) <- gsub("gravity", "Gravity", names(tidy_data))
names(tidy_data) <- gsub("BodyBody", "Body", names(tidy_data))

names(tidy_data) <- gsub("-mean()", "Mean", names(tidy_data), ignore.case = TRUE)
names(tidy_data) <- gsub("-std()", "StandardDeviation", names(tidy_data), ignore.case = TRUE)
names(tidy_data) <- gsub("-freq()", "Frequency", names(tidy_data), ignore.case = TRUE)

names(tidy_data) <- gsub("\\()", "", names(tidy_data))
names(tidy_data) <- gsub("-X", "X", names(tidy_data))
names(tidy_data) <- gsub("-Y", "Y", names(tidy_data))
names(tidy_data) <- gsub("-Z", "Z", names(tidy_data))

names(tidy_data) <- tolower(gsub("(?<=[a-z0-9])(?=[A-Z])", "_", 
                                 names(tidy_data), perl = TRUE))
#names(tidy_data)

## 
## Step 5: From the data set in step 4, creates a second, independent tidy data 
## set with the average of each variable for each activity and each subject.
## 
tidy_data_mean <- tidy_data %>%
    group_by(subject, activity) %>%
    summarise_all(list(mean))
dim(tidy_data_mean)

## Write data set to text file.
write.table(tidy_data_mean, "tidy_data_mean.txt", row.name = FALSE)

## Verification
str(tidy_data_mean)
head(tidy_data_mean)
summary(tidy_data_mean)