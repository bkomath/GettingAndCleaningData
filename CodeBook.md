# CodeBook For Getting And Cleaning Data Project

## Getting and cleaning data follow some processes. 
>* Acquire Data 
>* Transform for a specific need.
>* Provide a tidy dataset

## Pre-requiresist
Before doing any of this step, we need to setup the working environment including path and directory for the incoming database. 

###**I) Acquire Data:**
All start by getting the dataset first. Our dataset is zipfile on the link bellow. https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* Download the zipfile using **download.file()** function.
`download.file(fileUrl, destfile="./dbase/samsgs.zip")`  is the command issued to download zipfile from the website. Here:
    * **fileUrl** is the actual link provided above.
    * **destfile** is the new path of the downloaded zipfile with a new name called *samsgs*.
* Unzip the zipfile that is intended to provide the dataset.
`unzip(zipfile="./dbase/samsgs.zip", exdir="./dbase")`. This will make work done.

* Check out what is inside of that generated folder caused by unzip().
we need to provide new path and list all the things inside of that folder. A function **list.files()** which takes *reper* (directory of the new created folder) as argument: See Full command bellow
`fich <- list.files(reper, recursive=TRUE)`

[1] "activity_labels.txt"                         
[2] "features.txt"                                
[3] "features_info.txt"                           
[4] "README.txt"                                  
[5] "test/Inertial Signals/body_acc_x_test.txt"   
[6] "test/Inertial Signals/body_acc_y_test.txt"   
[7] "test/Inertial Signals/body_acc_z_test.txt"   
[8] "test/Inertial Signals/body_gyro_x_test.txt"  
[9] "test/Inertial Signals/body_gyro_y_test.txt"  
[10] "test/Inertial Signals/body_gyro_z_test.txt"  
[11] "test/Inertial Signals/total_acc_x_test.txt"  
[12] "test/Inertial Signals/total_acc_y_test.txt"  
[13] "test/Inertial Signals/total_acc_z_test.txt"  
[14] "test/subject_test.txt"                       
[15] "test/X_test.txt"          
[16] "test/y_test.txt"                             
[17] "train/Inertial Signals/body_acc_x_train.txt" 
[18] "train/Inertial Signals/body_acc_y_train.txt" 
[19] "train/Inertial Signals/body_acc_z_train.txt" 
[20] "train/Inertial Signals/body_gyro_x_train.txt"
[21] "train/Inertial Signals/body_gyro_y_train.txt"
[22] "train/Inertial Signals/body_gyro_z_train.txt"
[23] "train/Inertial Signals/total_acc_x_train.txt"
[24] "train/Inertial Signals/total_acc_y_train.txt"
[25] "train/Inertial Signals/total_acc_z_train.txt"
[26] "train/subject_train.txt"                     
[27] "train/X_train.txt"                           
[28] "train/y_train.txt" 

###**II) Transform for specific needs:**
  >  One of the main goals of this stage is to merge (combine) specific data. Until now, we don't have a working dataset yet.
  
  **1) Merging:**
  
The project assignment requires us to **merge** the training and test sets to create a single dataset with.
We have three components that deal with traing and test datasets: They are **activities, features, subjects.**
  
   * Acquire activities based information on trainning and testing.

   `activityTrainData <- read.table(file.path(reper, "train", "y_train.txt"), header=FALSE)`
   
   `activityTestData <- read.table(file.path(reper, "test", "y_test.txt"), header=FALSE)`
   
   * Acquire features based information on trainning and testing.
   
   `featureTrainData <- read.table(file.path(reper, "train", "X_train.txt"), header=FALSE)`

   `featureTestData <- read.table(file.path(reper, "test", "X_test.txt"), header=FALSE)`

   * Acquire subjects based information on trainning and testing.
   
   `subjectTrainData <- read.table(file.path(reper, "train", "subject_train.txt"), header=FALSE)`

   `subjectTestData <- read.table(file.path(reper, "test", "subject_test.txt"), header=FALSE)`

Merging data requires concatenation, creating new variable names or manipulating with existing name.

*  Example of concatenation:
I used rbind() command to concatenate by row each variable data  into one variable data (activity data, subject data, and feature data). In order words a reduction of variables. See scripts bellow.
      
   `actData <- rbind(activityTrainData, activityTestData)` for activities data.
   
   `subjData <- rbind(subjectTrainData, subjectTestData)` for subjects data.
   
   `featData <- rbind(featureTrainData, featureTestData)` for features data.
* Example of assigning names:
Giving names to created variables above is a required task of the project assignments.

   `names(actData) <- c("activity")`
This will assign **activity** as a name for the combine activities' training and test data.

   `names(subjData) <- c("subject")`
This will assign **subject** as a name for the combine subjects' training and test data.

    We need to keep the same names as original data set for the variable "featData".
    
    `FeatureOldName <- read.table(file.path(reper, "features.txt"), head=FALSE)`
This is going to be read and store under **feature.txt** file on the variable **FeatureOldName**. FeatureOldName$V2 is the actual field where those names are located.

`names(featData ) <- FeatureOldName$V2` setup the names.

Now we can create the dataset of the 3 variables  by using cbind() function.

`DataV <- cbind(subjData, actData)`
`DataF <-cbind(featData, DataV)`

**`DataF`** is the reference for the merging part of the assignment. This is the working dataset we have worked for.

**2) Extracting**
Based on the assigned task, not all the information on the working dataset are useful. Therefore, the project assignment asked to extract or sort data on related to mean and standard deviation of the measurement. 
I used the function grep() find any name that matches or contains with mean(), std() gsub() function 

Here, we have many data file and we need some of them.


