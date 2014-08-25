Code Book for the Tidy Dataset Produced by run_analysis.R
===================================================================================

The first 3 columns in the tidy data set are record identifiers:

 * actName: Name of the activity being measured
 * subject: subject id that performs the activity
 * activity: activity code matching the activity name

The measurement columns in the tidy data set are the average value of the mean ( -mean() ) and standard deviation ( -std() ) on below measurements per activity per subject:

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
