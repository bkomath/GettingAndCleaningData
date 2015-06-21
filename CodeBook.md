# CodeBook For Getting And Cleaning Data Project
---

## Download raw data set
Unzip the downloaded zip file and load it to Rstudio.

**fich** is the container of all the ```txt``` files from the unzip folder.
```{r eval=FALSE}
fich <- list.files(reper, recursive=TRUE)
```
-----
We are interested to 3 components and associated files.
 
**1)  Variable activities:**
```{r}
[1] "activity_labels.txt"  
[16] "test/y_test.txt"  
[28] "train/y_train.txt" 

```
**2) Variable subjects:**
```{r}
[14] "test/subject_test.txt" 
[26] "train/subject_train.txt"

```
**3) variable features:**
```{r eval=FALSE}
[2] "features.txt"  
[15] "test/X_test.txt" 
[27] "train/X_train.txt"
```
### Created variables:

**activityTrainData:** stores  activities' train data. 

**activityTestData:** stores activities' test data.

**featureTrainData:** stores features' train data.

**featureTestData:** stores features' test data.

**subjectTrainData:** stores subjects' train data.

**subjectTestData:** stores subjects' test data.

----

#### Merging and labelling:
**actData:** stores the combined data for both  *train* and *test* activities.

**subjData:** stores the combined data for both  *train* and *test* subjects.

**featData:** stores the combined data for both  *train* and *test* features.

**FeatureOldName:** holds varaible names from feature.txt file.

**DataV:** stores binding data with `subjData` and `actData`.

**DataF:** stores the working data set that had been obtain after merging and labelling. (For more informations see https://github.com/bkomath/GettingAndCleaningData/blob/master/README.Rmd)

-----
##### Extracting data:

**tid1** is the first tidy data set obtain from **DataF**(merged dataset). (For more informations see https://github.com/bkomath/GettingAndCleaningData/blob/master/README.Rmd)

####### Create second tidy data set:
**TidyData** is the final tidy data set with the average of each variable for each activity and each subject. 
 (For more informations see https://github.com/bkomath/GettingAndCleaningData/blob/master/README.Rmd)
