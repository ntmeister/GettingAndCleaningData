library(data.table)

# Working directory for this project...
setwd("../project/")

# Check to see if the project data directory (UCI HAR Dataset) exists...
if (!file.exists("UCI HAR Dataset"))
{
  message("UCI HAR Dataset directory does NOT exist!")
  download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "UCI HAR Dataset.zip")
  unzip("UCI HAR Dataset.zip")
}

# Load Activities lookup table...
activities <- read.table("UCI HAR Dataset/activity_labels.txt")

# Load the column names into a data.frame called "features"
features <- read.table("UCI HAR Dataset/features.txt", col.names=c("ft_no", "feature_name"))

# Clean up the feature/varaible names...
# Change dashes to dots in the feature names...
features$feature_name <- gsub("-", ".", features$feature_name)
# Get rid of the open & close parens...
features$feature_name <- gsub("\\(\\)", "", features$feature_name)

# Load the data using features as the column names...
test_data <- read.table("UCI HAR Dataset/test/X_test.txt", col.names=features$feature_name)
# Load subjects and activities to add to the main dataset...
test_subjects <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names=c("subject_no"))
test_activity <- read.table("UCI HAR Dataset/test/y_test.txt", col.names=c("activity_no"))
# Add the activity_name to test_activity
test_activity$activity_name <- activities[test_activity$activity_no, 2]
# Now, put the subject and activity info together with the rest of the data...
test_data <- cbind(test_subjects, test_activity, test_data)


# Do the same thing with the train data...
train_data <- read.table("UCI HAR Dataset/train/X_train.txt", col.names=features$feature_name)
train_subjects <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names=c("subject_no"))
train_activity <- read.table("UCI HAR Dataset/train/y_train.txt", col.names=c("activity_no"))
train_activity$activity_name <- activities[train_activity$activity_no, 2]
train_data <- cbind(train_subjects, train_activity, train_data)

# Combine the test and train data frames...
dfData <- rbind(test_data, train_data)


# We only care about mean and std...
mean_and_std <- subset(features, grepl("mean()", features$feature_name) | (grepl("std()", features$feature_name)))
dfData <- dfData[ , c("subject_no", "activity_name", mean_and_std$feature_name)]

# Dump the newly constructed data frame to disk...
write.table(dfData, file="my_raw_output.txt", row.names=FALSE)

# Convert the data.frame to a data.table...
dtData <- data.table(dfData)

# Create a summary data.table which will hold the structure for the tidy data...
dtSummary <- data.table(subject_no=integer(0), activity_name=character(0), V1=numeric(0), variable=character(0))

# Now, for each variable, compute the average by subject and activity...
for (strVariable in mean_and_std$feature_name)
{
  dtTemp <- subset(dtData, select=c("subject_no", "activity_name", strVariable))
  setnames(dtTemp, strVariable, "var")
  dtTemp <- dtTemp[,mean(var),by=c("subject_no", "activity_name")]
  dtVarSummary <- cbind(dtTemp, variable=strVariable)
  dtSummary <- rbind(dtSummary, dtVarSummary)
}

# Clean up, rearrange, and sort the table...
setnames(dtSummary, "V1", "average")
dtSummary <- subset(dtSummary, select=c("subject_no", "activity_name", "variable", "average"))
dtSummary <- dtSummary[order(subject_no, activity_name, variable)]

# Save the data.table as the final tidy output to disk...
write.table(dtSummary, file="my_tidy_output.txt", row.names=FALSE)
