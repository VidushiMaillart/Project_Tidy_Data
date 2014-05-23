#This R code is written to carry out the project assignment of 
#Getting and Cleaning Data. We follow the instructions of the assignment.

#Step 0: Read in the different data sets as well as the labels

sub_train = read.table("./UCI HAR Dataset/train/subject_train.txt")
X_train = read.table("./UCI HAR Dataset/train/X_train.txt")
y_train = read.table("./UCI HAR Dataset/train/y_train.txt")
sub_test = read.table("./UCI HAR Dataset/test/subject_test.txt")
X_test = read.table("./UCI HAR Dataset/test/X_test.txt")
y_test = read.table("./UCI HAR Dataset/test/y_test.txt")

activity_name = read.table("./UCI HAR Dataset/activity_labels.txt")
features_name = read.table("./UCI HAR Dataset/features.txt")

#Step 1: Combining the data

data_train = cbind(X_train, y_train, sub_train)
data_test  = cbind(X_test, y_test, sub_test)
data = rbind(data_train, data_test)
colnames(data) <- c(as.character(features_name[,2]), "activity", "subject")
                    
#Step 2 : Extract the relevant data

data1 <- cbind(data[,562:563], data[,1:6], data[,41:46], data[,81:86], data[,121:126], data[,161:166], 
               data[,201:202], data[,214:215], data[,227:228], data[,240:241], data[,253:254], 
               data[,266:271], data[,345:350], data[,424:429], data[,503:504], data[,516:517],
               data[,529:530], data[,542:543])

#Step 3 : Replacing the integer value activity names with resp. activity names

y <- data1$activity
y1 <- sapply(y, function(x) {
        if(x == 1) {a <- "walking"}
        if(x == 2) {a <- "walking_upstairs"}
        if(x == 3) {a <- "walking_downpstairs"}
        if(x == 4) {a <- "sitting"}
        if(x == 5) {a <- "standing"}
        if(x == 6) {a <- "laying"}
        x <- a})
data1$activity <- y1


#Step 4. Replacing the column names with tidier names

y <- colnames(data1)
y <- gsub("-", ".", y)
y <- gsub("tB", "time.b", y)
y <- gsub("tG", "time.g", y)
y <- gsub("fB", "frequency.b", y)
y <- gsub("Acc", ".acceleration", y)
y <- gsub("Gyro", ".gyro", y)
y <- gsub("Jerk", ".jerk", y)
y <- gsub("Body", ".body", y)
y <- gsub("Mag", ".magnitude", y)
y <- gsub("\\()", "", y)
colnames(data1) <- y


#Step 5. new data set with the average of each variable for each activity and each subject

tidy_data <- aggregate(data1[,3:68], by = list(data1$activity, data1$subject), FUN = mean)
colnames(tidy_data) <- colnames(data1)
write.table(tidy_data, "./tidy_data.txt", col.names = TRUE)
