GettingAndCleaningData codebook
===============================

This codebook is intended to describe the dataset required by the project from Coursera's "Getting and Cleaning Data" course.  Please refer to the accompanying **README.md** file to learn how to build the file described within this codebook.

Structure of Tidy Dataset
-------------------------

The following table describes each column of output in the **my_tidy_output.txt** file:

Column Name     | Data Type (Class) | Description
--------------- | ----------------- | ------------------------------------------------------------------------------------
subject_no      | integer           | Represents the subject (person) from which the data was collected.  Numbers 1 through 30.
activity_name   | character         | Represents the activity being performed by the subject when the data was collected.  Levels - LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS
variable        | character         | This is an abbreviated description of the feature of data being collected from the subject for the activity.  *Disclaimer*: I am not an expert in what these variables are, so I have no intention of describing the meaning of each variable.  Each variable either represents a mean or a standard deviation value.  See below for a full list of the variables that appear in this column.
average         | numeric           | This value is an aggregated average of all of the values collected for the corresponding variable, activity and subject (as was requested in the instructions for this project).


Variables
---------
Again, I do not claim to know what these brief variable descriptions are, nor do I want to do the research.  After all, this is just a class project designed to teach me how to clean up a messy data set.  I'm sure there will be opportunities in the future to fully research the meaning of all variables within an analysis when I am the playing the role of data scientist for data I actually care about.  :)  There are 78 distinct variable names I could find in the raw dataset that contain either the word "mean" or "std".  They are as follows:

* fBodyAcc.mean.X
* fBodyAcc.mean.Y
* fBodyAcc.mean.Z
* fBodyAcc.meanFreq.X
* fBodyAcc.meanFreq.Y
* fBodyAcc.meanFreq.Z
* fBodyAcc.std.X
* fBodyAcc.std.Y
* fBodyAcc.std.Z
* fBodyAccJerk.mean.X
* fBodyAccJerk.mean.Y
* fBodyAccJerk.mean.Z
* fBodyAccJerk.meanFreq.X
* fBodyAccJerk.meanFreq.Y
* fBodyAccJerk.meanFreq.Z
* fBodyAccJerk.std.X
* fBodyAccJerk.std.Y
* fBodyAccJerk.std.Z
* fBodyAccMag.mean
* fBodyAccMag.meanFreq
* fBodyAccMag.std
* fBodyBodyAccJerkMag.mean
* fBodyBodyAccJerkMag.meanFreq
* fBodyBodyAccJerkMag.std
* fBodyBodyGyroJerkMag.mean
* fBodyBodyGyroJerkMag.meanFreq
* fBodyBodyGyroJerkMag.std
* fBodyBodyGyroMag.mean
* fBodyBodyGyroMag.meanFreq
* fBodyBodyGyroMag.std
* fBodyGyro.mean.X
* fBodyGyro.mean.Y
* fBodyGyro.mean.Z
* fBodyGyro.meanFreq.X
* fBodyGyro.meanFreq.Y
* fBodyGyro.meanFreq.Z
* fBodyGyro.std.X
* fBodyGyro.std.Y
* fBodyGyro.std.Z
* tBodyAcc.mean.X
* tBodyAcc.mean.Y
* tBodyAcc.mean.Z
* tBodyAcc.std.X
* tBodyAcc.std.Y
* tBodyAcc.std.Z
* tBodyAccJerk.mean.X
* tBodyAccJerk.mean.Y
* tBodyAccJerk.mean.Z
* tBodyAccJerk.std.X
* tBodyAccJerk.std.Y
* tBodyAccJerk.std.Z
* tBodyAccJerkMag.mean
* tBodyAccJerkMag.std
* tBodyAccMag.mean
* tBodyAccMag.std
* tBodyGyro.mean.X
* tBodyGyro.mean.Y
* tBodyGyro.mean.Z
* tBodyGyro.std.X
* tBodyGyro.std.Y
* tBodyGyro.std.Z
* tBodyGyroJerk.mean.X
* tBodyGyroJerk.mean.Y
* tBodyGyroJerk.mean.Z
* tBodyGyroJerk.std.X
* tBodyGyroJerk.std.Y
* tBodyGyroJerk.std.Z
* tBodyGyroJerkMag.mean
* tBodyGyroJerkMag.std
* tBodyGyroMag.mean
* tBodyGyroMag.std
* tGravityAcc.mean.X
* tGravityAcc.mean.Y
* tGravityAcc.mean.Z
* tGravityAcc.std.X
* tGravityAcc.std.Y
* tGravityAcc.std.Z
* tGravityAccMag.mean
* tGravityAccMag.std

Format / Order
--------------
The final dataset written to **my_tidy_output.txt** is sorted first by the subject_no, then by the activity_name, then by the variable.  For 30 subjects, 6 activities, and 78 variables, this amounts to (30 * 6 * 78) = 14,220 rows of data.

Have a nice day.
