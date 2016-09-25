## Download and unzip dataset from website
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
f <- file.path(getwd(), "AssDts.zip")
download.file(url, f)
unzip("AssDts.zip")

## Load Metadata
features<-read.table("UCI HAR Dataset/features.txt")
activity<-read.table("UCI HAR Dataset/activity_labels.txt")[,2]
## Load Test data:
XTest<- read.table("UCI HAR Dataset/test/X_test.txt")
YTest<- read.table("UCI HAR Dataset/test/Y_test.txt")
SubjectTest <-read.table("UCI HAR Dataset/test/subject_test.txt")
## Load Train data:
XTrain<- read.table("UCI HAR Dataset/train/X_train.txt")
YTrain<- read.table("UCI HAR Dataset/train/Y_train.txt")
SubjectTrain <-read.table("UCI HAR Dataset/train/subject_train.txt")

##1. Merges the training and the test sets to create one data set.
MrgData <- rbind(XTest, XTrain)
names(MrgData) = features[,2]

##2. Extracts only the measurements on the mean and standard deviation for each measurement.
features <- make.names(features[,"V2"])
FltData <- MrgData[,grepl(pattern="mean|std", colnames(MrgData), ignore.case=TRUE)]

##3. Uses descriptive activity names to name the activities in the data set
Y <- rbind(YTest, YTrain)
Y[,2] = activity[Y[,1]]
ActData = cbind(Y[,2], FltData)

##4. Appropriately labels the data set with descriptive variable names.
colnames(ActData)[1] = "Activity"

##5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
SubData <- cbind(rbind(SubjectTest,SubjectTrain), ActData)
colnames(SubData)[1] = "Subject"
TidyData <- aggregate(SubData, by=list(SubData$Subject,SubData$Activity), FUN=mean)
TidyData <- TidyData[,-c(3,4)]
colnames(TidyData)[1:2] = c("Subject","Activity")
write.table(TidyData, "TidyData.txt", row.name=FALSE)


