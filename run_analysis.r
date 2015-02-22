library(dplyr)
library(reshape2)

# Load data
file <- "./UCI HAR Dataset/test/X_test.txt"
X_test <- read.table(file,stringsAsFactors = FALSE)
file <- "./UCI HAR Dataset/test/y_test.txt"
y_test <- read.table(file,stringsAsFactors = FALSE)
file <- "./UCI HAR Dataset/test/subject_test.txt"
subject_test <- read.table(file,stringsAsFactors = FALSE)
file <- "./UCI HAR Dataset/train/X_train.txt"
X_train <- read.table(file,stringsAsFactors = FALSE)
file <- "./UCI HAR Dataset/train/y_train.txt"
y_train <- read.table(file,stringsAsFactors = FALSE)
file <- "./UCI HAR Dataset/train/subject_train.txt"
subject_train <- read.table(file,stringsAsFactors = FALSE)
file <- "./UCI HAR Dataset/features.txt"
features <- read.table(file,stringsAsFactors = FALSE)
file <- "./UCI HAR Dataset/activity_labels.txt"
act_labels <- read.table(file,stringsAsFactors = FALSE)

# Combine test set, training set, and activity vector(y_test & y_train)
tests_set <- cbind(subject_test,y_test,X_test)
training_set <- cbind(subject_train,y_train,X_train)
whole_data <- rbind(tests_set,training_set)

# rename the columns of each measurments by using the features.txt file
features <- rbind(c("sub","Subject"),c("act","Activity"),features) # add twon rows into features list (one row for Subject and the other for Activity)
colnames(whole_data)=features[,2]

# bringing in descriptive activity names
whole_data <- merge(whole_data, act_labels, by.x="Activity", by.y="V1", all.x=TRUE)
# Uses descriptive activity names to name the activities in the data set 
whole_data$Activity <- whole_data$V2
whole_data <- whole_data[,-564] # drop the last column cuz duplicate Activity info

# find mean() and std() variables' index 
# my methos is to search the features list for any variable having either "mean()" or "std()" in it 
mean_index <- grep("mean()",features$V2,fixed=TRUE)
std_index <- grep("std()",features$V2,fixed=TRUE)

# Extracts only the measurements on the mean and standard deviation for each measurement
columns_index <- sort(unique(c(mean_index,std_index)))
Step4_data <- whole_data[,c(1,2,columns_index)]

# summarize Tidy_data by calculating the average of each variable for each activity and each subject
Tidy_dataMelt <- melt(Step4_data, id=c("Subject","Activity"),measure.vars=names(Step4_data[c(-1,-2)]))
Tidy_dataset <- dcast(Tidy_dataMelt,Subject+Activity ~ variable,mean)

#output to .txt file
write.table(Tidy_dataset,file="./Tidy_dataset.txt",row.names=FALSE)