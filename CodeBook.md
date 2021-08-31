Getting and Cleaning Data - Week 4 - CodeBook 
(Processed data by Kirill Tristan)

Identifiers
subject - Subjects numbers (1:30)                  
activity - Activity performed (Walking, Walking upstairs, Walking downstairs, Sitting, Standing, Laying) (6).

Measurements

tbodyacc_mean_x           tbodyacc_mean_y           tbodyacc_mean_z          
tbodyacc_std_x            tbodyacc_std_y            tbodyacc_std_z            tgravityacc_mean_x        tgravityacc_mean_y       
tgravityacc_mean_z        tgravityacc_std_x         tgravityacc_std_y         tgravityacc_std_z         tbodyaccjerk_mean_x      
tbodyaccjerk_mean_y       tbodyaccjerk_mean_z       tbodyaccjerk_std_x        tbodyaccjerk_std_y        tbodyaccjerk_std_z       
tbodygyro_mean_x          tbodygyro_mean_y          tbodygyro_mean_z          tbodygyro_std_x           tbodygyro_std_y          
tbodygyro_std_z           tbodygyrojerk_mean_x      tbodygyrojerk_mean_y      tbodygyrojerk_mean_z      tbodygyrojerk_std_x      
tbodygyrojerk_std_y       tbodygyrojerk_std_z       tbodyaccmag_mean          tbodyaccmag_std           tgravityaccmag_mean      
tgravityaccmag_std        tbodyaccjerkmag_mean      tbodyaccjerkmag_std       tbodygyromag_mean         tbodygyromag_std         
tbodygyrojerkmag_mean     tbodygyrojerkmag_std      fbodyacc_mean_x           fbodyacc_mean_y           fbodyacc_mean_z          
fbodyacc_std_x            fbodyacc_std_y            fbodyacc_std_z            fbodyaccjerk_mean_x       fbodyaccjerk_mean_y      
fbodyaccjerk_mean_z       fbodyaccjerk_std_x        fbodyaccjerk_std_y        fbodyaccjerk_std_z        fbodygyro_mean_x         
fbodygyro_mean_y          fbodygyro_mean_z          fbodygyro_std_x           fbodygyro_std_y           fbodygyro_std_z          
fbodyaccmag_mean          fbodyaccmag_std           fbodybodyaccjerkmag_mean  fbodybodyaccjerkmag_std   fbodybodygyromag_mean    
fbodybodygyromag_std      fbodybodygyrojerkmag_mean fbodybodygyrojerkmag_std 

Were:
	t - time
	f - frequency domain signals
	body - Body
	gravity - Gravity
	acc - Acceleration/Accelerometer
	gyro - Gyroscope
	body - Body linear acceleration
	jerk - Jerk signals
	mag - Magnitude
	x|y|z - Axis
	mean - Mean
	std - Standard deviation

Modifications

The main modifications applied to the original data are:
	-Transpose features.txt from a column to a row.
	-Activities were changed from numbers to characters.
	-Train and test subjects with measurements were merged into one data frame.
	-Subjects were ordered in an ascending manner.
	-Measurements used: mean and standard deviation (std). (66 of 561 measurements).
	-Modified the measurement names: deleted "()", swapped "-" to "_", and lowercase all the characters.
	-Created a new tidy data frame for step 5 with the averages of each measurement for each activity and subject.
	-New tidy data frame 68 columns (subject,activity,66 measurements) and 180 rows (30 subjects and 6 activities each).
