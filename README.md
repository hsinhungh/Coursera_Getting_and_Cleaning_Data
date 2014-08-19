run_analysis.R
===================================================================================
This R script is to be applied on the "Human Activity Recognition Using Smartphones Dataset". The dataset can be downloaded here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The script performs the following operations:

  1. From both training and test data sets, extracts only the measurements on the mean and standard deviation for each measurement.
  2. Labels each measurements (columns) with descriptive names.
  3. Adds subject and activity codes into extracted data sets.
  4. Merges extracted training and test data sets
  5. Labels activities with descriptive names.
  6. The script finally creates an independent tidy data set with the average of each variable per activity per subject.


The first 3 columns in the tidy data set are record identifiers:

 * actName: Name of the activity being measured
 * subject: subject id that performs the activity
 * activity: activity code matching the activity name

The measurement columns in the tidy data set are the average value of the mean ( -mean() ) and standard deviation ( -std() ) on below estimates per activity per subject:

 * tBodyAcc-XYZ
 * tGravityAcc-XYZ
 * tBodyAccJerk-XYZ
 * tBodyGyro-XYZ
 * tBodyGyroJerk-XYZ
 * tBodyAccMag
 * tGravityAccMag
 * tBodyAccJerkMag
 * tBodyGyroMag
 * tBodyGyroJerkMag
 * fBodyAcc-XYZ
 * fBodyAccJerk-XYZ
 * fBodyGyro-XYZ
 * fBodyAccMag
 * fBodyAccJerkMag
 * fBodyGyroMag
 * fBodyGyroJerkMag
 
The detailed description of the orignal data set and each measurement can be found in "README.dataset.txt" and "features_info.dataset.txt".
