## As requiered must document every action in the script, so:
## library ("dplyr") must be installed

library("dplyr")

## Preparing foder and download the zip file
if(!file.exists("./03GandCData/4WeekQuiz/FProject")){dir.create("./03GandCData/4WeekQuiz/FProject")}
zipUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(zipUrl, destfile = "./03GandCData/4WeekQuiz/FProject/GaC_Final.zip", method = "curl")

## Unzip zip file in th folder
old.dir <- getwd()
setwd("./03GandCData/4WeekQuiz/FProject")

dataPath <- "./03GandCData/4WeekQuiz/FProject/UCI HAR Dataset"
if(!file.exists(dataPath)) {unzip("GaC_Final.zip")}


## Proceed to merge training and test sets to create one data set
## reading data and assigning all dataframes
features <- read.table("./UCI HAR Dataset/features.txt", col.names = c("n","functions"))
activities <- read.table("./UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))

test_s <- read.table("./UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
test_x <- read.table("./UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
test_y <- read.table("./UCI HAR Dataset/test/y_test.txt", col.names = "code")

train_s <- read.table("./UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
train_x <- read.table("./UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
train_y <- read.table("./UCI HAR Dataset/train/y_train.txt", col.names = "code")

## run_analys.R script starts from here
##  Step 1: Merges the training and the test sets to create one data set.
X <- rbind(train_x, test_x)
Y <- rbind(train_y, test_y)
Subject <- rbind(train_s, test_s)
Merged_Data <- cbind(Subject, Y, X)

## Step 2: Extracts only the measurements on the mean and standard deviation for each measurement.
TidyData <- Merged_Data %>% select(subject, code, contains("mean"), contains("std"))

## Step 3: Uses descriptive activity names to name the activities in the data set.
TidyData$code <- activities[TidyData$code, 2]

## Step 4: Appropriately labels the data set with descriptive variable names.
names(TidyData)[2] = "activity"
names(TidyData)<-gsub("Acc", "Accelerometer", names(TidyData))
names(TidyData)<-gsub("Gyro", "Gyroscope", names(TidyData))
names(TidyData)<-gsub("BodyBody", "Body", names(TidyData))
names(TidyData)<-gsub("Mag", "Magnitude", names(TidyData))
names(TidyData)<-gsub("^t", "Time", names(TidyData))
names(TidyData)<-gsub("^f", "Frequency", names(TidyData))
names(TidyData)<-gsub("tBody", "TimeBody", names(TidyData))
names(TidyData)<-gsub("-mean()", "Mean", names(TidyData), ignore.case = TRUE)
names(TidyData)<-gsub("-std()", "Standard", names(TidyData), ignore.case = TRUE)
names(TidyData)<-gsub("-freq()", "Frequency", names(TidyData), ignore.case = TRUE)
names(TidyData)<-gsub("angle", "Angle", names(TidyData))
names(TidyData)<-gsub("gravity", "Gravity", names(TidyData))

## Step 5: From the data set in step 4, creates a second, independent tidy data set with the average 
## of each variable for each activity and each subject.
FinalData <- TidyData %>%
    group_by(subject, activity) %>%
    summarise_all(list(mean))
write.table(FinalData, "FinalData.txt", row.name=FALSE)
