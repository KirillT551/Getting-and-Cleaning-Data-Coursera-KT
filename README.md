Getting and Cleaning Data - Week 4 - Peer Revies Assignment
Autor: Kirill Tristan

For this week project, we are going to get and clean data form the UCI HAR Dataset.

How does this script works:
1.Downloads the .zip file and unzips it.
2.Checks the directory content. 

3.Reads feature.txt and creates a data frame called feat.
4.Tranpose feat and deletes the first row.

5.Reads subject_test.txt and creates a data frame called testsub
6.Change the column name to "subject".

7.Reads X_test.txt and creates a data frame called testset.
8.Change the column names to the values in feat data frame.

9.Reads y_test.txt and creates a data frame called testlabel.
10.Change the column name to "activity".
11.Define testlabel as factor and define its levels.

10.Merge testlabel with testset and creates a new data frame called test.
11.Merge testsub with test and updates test data frame.

12.Reads subject_train.txt and creates a data frame called trainsub
13.Change the column name to "subject".

14.Reads X_train.txt and creates a data frame called trainset.
15.Change the column names to the values in feat data frame.

16.Reads y_train.txt and creates a data frame called trainlabel.
17.Change the column name to "activity".
18.Define trainlabel as factor and define its levels.

19.Merge trainlabel with trainset and creates a new data frame called train.
20.Merge trainsub with terain and updates train data frame.

21.Merge train and test into a new data frame called trte
22.Reorder trte based on the subject in an ascending manner.
23.Define subject column as factor.

24.Format the variables by lowercasing each letter, changing "-" to "_" and deleting "()".

25.Create a blank data frame called trtef for step 5.
26.Use a for loop to obtain the mean of each variable for each subject and activity.
27.Create a text file called tidystep5_msa.txt which contains the tidy data set.