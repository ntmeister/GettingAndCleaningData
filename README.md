
GettingAndCleaningData
======================

The files in this directory correspond to the requirements for the course project in Coursera's "Getting and Cleaning Data" course.

 
From the project instructions:
------------------------------

> The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  
> 
> One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 
> 
> http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
> 
> Here are the data for the project: 
> 
> https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
> 
> You should create one R script called run_analysis.R that does the following. 
> 1. Merges the training and the test sets to create one data set.
> 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
> 3. Uses descriptive activity names to name the activities in the data set
> 4. Appropriately labels the data set with descriptive variable names. 
> 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
> 
> Good luck!


Files
------

File              | Comment
----------------- | -------------------------------------------------------------------------
README.md         | This file
codebook.md       | A markdown document that explains the process to create the tidy data set.
run_analysis.R    | The R code script that does the actual data tidying.  See codebook.md to learn more.
my_tidy_output.txt| The final output as described in step 5 within the project instructions.


Process of building the dataset
-------------------------------

To recreate the process of building the dataset, follow these steps:

1. Create a directory on your computer and put the **run_analysis.R** file inside this directory.
2. Edit the accompanying **run_analysis.R** file on line 4, updating the call to "setwd" to reference the full path of the directory you created in step 1.
3. In your R environment (the code was written using R version 3.1.1), set your working directory to the same directory created in step 1, then run the script using the following command:
``` 
source("run_analysis.R")
```

If the **UCI HAR Dataset** subfolder does not already exist, the script will download the zip file from the Internet, and unzip it to create the subfolder for you.

The script will then read several files to build a raw data set according to the project instructions.  The raw output will be written as **my_raw_output.txt**.  This file may be ignored as it is not required for the purpose of this project.

The final summarized tidy dataset will be written to **my_tidy_output.txt**.

Please refer to the accompanying **codebook.md** file to obtain an understanding of the structure of the **my_tidy_output.txt** file.
