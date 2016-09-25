##Getting and Cleaning Data Course Project: Code Book

Create one R script called run_analysis.R and output one text file called TidyData.txt that does the following.

###0. Download the file for the project website

Dimensions Name:
features
activity

Dimensions ID:
YTest
SubjectTest
YTrain
SubjectTrain

Data:
XTest
XTrain

###1.Merges the training and the test sets to create one data set.

MrgData - Merge the Data from XTest and XTrain.

###2.Extracts only the measurements on the mean and standard deviation for each measurement.

FltData - Filter only with mean and standard deviation from MrgData

###3.Uses descriptive activity names to name the activities in the data set

ActData - Added the Activity Dimension from FltData

###4.Appropriately labels the data set with descriptive variable names.

ActData - Change the Activity Dimension column name to Activity

###5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

SubData - Added the Activity Dimension and change the column name from ActData

TidyData - Aggregate the average of each variable for each activity and each subject.