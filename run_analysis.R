setwd("C:/Coursera/DataScience/GettingCleaning/Projects") ## Set up the working directory
##Create a directory "dbase" for the dataset
if(!file.exists("./dbase")){
  dir.create("./dbase")}
## Get the URL of the dataset in zip format
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

## Download the zip file to "dbase" folder called "samsgs.zip
download.file(fileUrl, destfile="./dbase/samsgs.zip")

## unzip the "samsgs.zip" in order to obtain the actual dataset
unzip(zipfile="./dbase/samsgs.zip", exdir="./dbase")

## construct the path of the dataset
reper <- file.path("./dbase", "UCI HAR Dataset")
reper
## list the files contained in the data set.
fich <- list.files(reper, recursive=TRUE)
fich



## Our target information concern three variables which are "Activities", "Subjects", and "Features" for each training and test data sets.
## We need to obtain these data mapping to each of those variables as preliminary.

 ## Reading activities data sets and their properties
activityTrainData <- read.table(file.path(reper, "train", "y_train.txt"), header=FALSE)
activityTestData <- read.table(file.path(reper, "test", "y_test.txt"), header=FALSE)

str(activityTrainData)
str(activityTestData)
## Reading features data sets and their properties
featureTrainData <- read.table(file.path(reper, "train", "X_train.txt"), header=FALSE)
featureTestData <- read.table(file.path(reper, "test", "X_test.txt"), header=FALSE)

str(featureTrainData)
str(featureTestData)

## Reading Subjects data sets and their properties
subjectTrainData <- read.table(file.path(reper, "train", "subject_train.txt"), header=FALSE)
subjectTestData <- read.table(file.path(reper, "test", "subject_test.txt"), header=FALSE)

str(subjectTrainData)
str(subjectTestData)

### Merge the training and test sets to create on dataset.
#### Merging is not always a straightforward task unless the data set met some citerium. Here we need to work  
   # 1) concatenate the data tables by rows
      actData <- rbind(activityTrainData, activityTestData)
      subjData <- rbind(subjectTrainData, subjectTestData)
      featData <- rbind(featureTrainData, featureTestData)
  # 2) Give names to created variables.
      names(actData) <- c("activity")
      names(subjData) <- c("subject")
    ## we need to keep the same names as original data set for the variable "featData" or originally features.
      FeatureOldName <- read.table(file.path(reper, "features.txt"), head=FALSE)
      names(featData ) <- FeatureOldName$V2

 # 3)  Merge the 3 variables alltogether by columns
      DataV <- cbind(subjData, actData)
      DataF <-cbind(featData, DataV)
     str(DataF)

### Extracts only the measurements on the mean and standard deviation for each measurement. 
### This is actually done by using regular expression "grep" to sort the requested measurement
          ###  we need to find the descriptive name mean() and std-deviation from FeatureOldName$V2
          findDescName <- FeatureOldName$V2[grep("mean\\(\\)|std\\(\\)", FeatureOldName$V2]
     
          ### Create a subset data frame based on the descriptive variables, subjectData, actData
          selcName <- c(as.character(findDescName), "subject", "activity")
                                                                            ### DataExtr <- subset(DataF, seclect=selcName)
          tid1<-  DataF[selcName]
          names(tid1)
          
          ## look at the first 3 data
          head(tid1,3)
          ## Property of the subset data frame
          str(tid1)


## 3) Uses descriptive activity names to name the activities in the data set.
    ## Check the what names are under "activity_labels.txt"
     activityNames <- read.table(file.path(reper, "activity_labels.txt"),header = FALSE)
    ## We first set the contain of the column activity as string characters
    tid1$activity <- as.character(tid1$activity)
    tid1$activity[tid1$activity == 1] <- "Walking"
    tid1$activity[tid1$activity == 2] <- "Walking Upstairs"
    tid1$activity[tid1$activity == 3] <- "Walking Downstairs"
    tid1$activity[tid1$activity == 4] <- "Sitting"
    tid1$activity[tid1$activity == 5] <- "Standing"
    tid1$activity[tid1$activity == 6] <- "Laying"
    head(tid1$activity, 45)

## 4) Appropriately labels the data set with descriptive variable names.
    ## gsub() function is used to perform all matches.See (http://www.inside-r.org/r-doc/base/sub)
names(tid1)<-gsub("^t", "time", names(tid1))
names(tid1)<-gsub("^f", "frequency", names(tid1))
names(tid1)<-gsub("Acc", "Accelerometer", names(tid1))
names(tid1)<-gsub("Gyro", "Gyroscope", names(tid1))
names(tid1)<-gsub("Mag", "Magnitude", names(tid1))
names(tid1)<-gsub("BodyBody", "Body", names(tid1))
names(tid1)
str(tid1)

## Our first tidy data.
tidyData1 <- tid1
str(tidyData1)
write.table(tidyData1, file = "Tidy1.txt", row.names = FALSE)

## 5) From the data set in step 4, creates a second, independent tidy data set with average of each variable for each activity and each subject.
library(data.table)
data.dt <- data.table(tidyData1)
str(data.dt)
TidyData <-aggregate(.~subject + activity, data.dt, mean)
TidyData <-TidyData[order(TidyData$subject, TidyData$activity),]
write.table(TidyData, file = "Tidy2.txt", row.names = FALSE)
