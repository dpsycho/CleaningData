

# Load dplyr 
library(dplyr)
# Set working directory
setwd("C:/Users/NEUROCOM-DP/R datasets/CleaningData/week4/UCI HAR Dataset")

# Read activity_labels.txt in avtivity_labels
activity_labels<- read.table("./activity_labels.txt", header=FALSE, sep="")
activity_labels<-rename(activity_labels, activity_id=V1)
activity_labels<-rename(activity_labels, activity_name=V2)

# Read features.txt in features
features<-read.table("./features.txt",header = FALSE,sep="", as.is=TRUE)
features<-rename(features, feature_id=V1)
features<-rename(features, feature_name=V2)

# Read test data

#Read X_test.txt in test_x
test_x<- read.table("./test/X_test.txt", header=FALSE, sep="")
#Read label test data in test_y
test_y<- read.table("./test/y_test.txt", header=FALSE, sep="")
test_subject<- read.table("./test/subject_test.txt", header=FALSE, sep="")

# Add subject_id column
test_x$subject_id<-test_subject[,"V1"]
test_x$activity_id<-test_y[,"V1"]

# Read train data in train_x
train_x<- read.table("./train/X_train.txt", header=FALSE, sep="")
# Read label train data in train_y
train_y<- read.table("./train/y_train.txt", header=FALSE, sep="")
train_subject<- read.table("./train/subject_train.txt", header=FALSE, sep="")
# Add subject_id column in train_x
train_x$subject_id<-train_subject[,"V1"]
train_x$activity_id <-train_y[,"V1"]


# Next use features to rename columns in test_x and train_x

# Rename test_x, and train_x columns that relate to mean and std to corresponding feature name, use features data frame 
# Search for mean and std measurements 
for (i in 1:nrow(features)) 

  if (  grepl ( "-mean()", features[i,"feature_name"])==TRUE | grepl ("-std()", features[i,"feature_name"])==TRUE ) {
    test_x<-dplyr::rename_(test_x, .dots=setNames(list(gsub (" ","",paste("V",i))), features[i,"feature_name"])    )
    train_x<-dplyr::rename_(train_x, .dots=setNames(list(gsub (" ","",paste("V",i))), features[i,"feature_name"])    )
  } 


# Produce merged data set, test_train_x, which contains data from both test and train data sets, and the columns required (mean,std)
test_train_x<- merge(  rbind(select(test_x, matches ( "mean|std|subject_id|activity_id" ) ), select(train_x, matches ( "mean|std|subject_id|activity_id" ) )),  activity_labels, by.X="activity_id",by.Y="activity_id")

# Produce the data set with the mean of each variable and activity and subject
# Use pipeline to read from test_train_x, perform the group_by. and the use summarise_each to produce
# means for each column
test_train_group <- test_train_x %>% group_by(subject_id,activity_id,activity_name) %>% summarise_each(funs(mean))

# Write test_train_group data in week4data.txt file
 write.table(test_train_group,file="./week4data.txt",row.names =FALSE,sep=",")
