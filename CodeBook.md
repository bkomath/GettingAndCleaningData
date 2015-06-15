# CodeBook For Getting And Cleaning Data Project

## Download from the given url the zip file and unzip it. 
 Based on the assignment, we are interested to 3 variables and associated files.
 
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
### Merging and labelling:

**DataF** is the working data set that had been obtain from merging and labelling. (For more informations see https://github.com/bkomath/GettingAndCleaningData/blob/master/README.Rmd)

### Extracting data:

**tid1** is the first tidy data set obtain from **DataF**(merged dataset).(For more informations see https://github.com/bkomath/GettingAndCleaningData/blob/master/README.Rmd)

#### Create second tidy data set:
**TidyData** is the final tidy data set with the average of each variable for each activity and each subject. 
 (For more informations see https://github.com/bkomath/GettingAndCleaningData/blob/master/README.Rmd)
