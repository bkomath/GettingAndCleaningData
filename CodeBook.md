# CodeBook For Getting And Cleaning Data Project

## Getting and cleaning data follow some processes. Therefore it is 

>* Acquire Data 
>* Transform for a specific need.
>* Provide a tidy dataset

## Pre-requiresist
Before doing any of this step, we need to setup the working environment including path and directory for the incoming database. 

**1) Acquire Data:**
All start by getting the dataset first. Our dataset is zipfile on the link bellow. https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* Download the zipfile using **download.file()** function.
download.file(fileUrl, destfile="./dbase/samsgs.zip")  is the command issued to download zipfile from the website. Here:
    * **fileUrl** is the actual link provided above.
    * **destfile** is the new path of the downloaded zipfile with a new name called *samsgs*.
