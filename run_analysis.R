## Merges the training and the test sets to create one data set.

features<-read.table("./UCI HAR Dataset/features.txt")

X_train<-read.table("./UCI HAR Dataset/train/X_train.txt")
subject_train<-read.table("./UCI HAR Dataset/train/subject_train.txt")
y_train<-read.table("./UCI HAR Dataset/train/y_train.txt")

colnames(X_train)<-features[,2]
colnames(subject_train)<-"subject"
colnames(y_train)<-"activity"

X_test<-read.table("./UCI HAR Dataset/test/X_test.txt")
subject_test<-read.table("./UCI HAR Dataset/test/subject_test.txt")
y_test<-read.table("./UCI HAR Dataset/test/y_test.txt")

colnames(X_test)<-features[,2]
colnames(subject_test)<-"subject"
colnames(y_test)<-"activity"

data_set<-rbind(train_set,test_set)


##Extracts only the measurements on the mean and standard deviation for each measurement. 

data_set_2<-data_set[,grep("std\\(|mean\\(",names(data_set))]
data_set_3<-cbind("subject"=data_set$subject,"activity"=data_set$activity,data_set_2)


## Uses descriptive activity names to name the activities in the data set

data_set_3$activity[data_set_3$activity==1]<-"WALKING"
data_set_3$activity[data_set_3$activity==2]<-"WALKING_UPSTAIRS"
data_set_3$activity[data_set_3$activity==3]<-"WALKING_DOWNSTAIRS"
data_set_3$activity[data_set_3$activity==4]<-"SITTING"
data_set_3$activity[data_set_3$activity==5]<-"STANDING"
data_set_3$activity[data_set_3$activity==6]<-"LAYING"


## Appropriately labels the data set with descriptive variable names. 
oldnames<-names(data_set_3)
newnames<-sub("^t","TimeDomain",oldnames)
newnames<-sub("^f","FrequencyDomain",newnames)
newnames<-sub("mean\\(\\)","Mean",newnames)
newnames<-sub("std\\(\\)","StandardDeviation",newnames)
newnames<-sub("AccJerk","LinearAccelerationJerk",newnames)
newnames<-sub("GyroJerk","AngularVelocityJerk",newnames)
newnames<-sub("AccMag","AccelerationMagnitude",newnames)
newnames<-sub("Acc-","Acceleration-",newnames)
newnames<-sub("GyroMag","AngularVelocityMagnitude",newnames)
newnames<-sub("Gyro-","AngularVelocity-",newnames)

colnames(data_set_3)<-newnames


## Write the new clean dataset to "clean-data-set.csv"
write.csv(data_set_3,file="clean-data-set.csv",row.names=FALSE)


## Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
dataMelt<-melt(data_set_3,id=c("subject","activity"),measure.vars=newnames[3:68])
dataCast<-dcast(dataMelt,subject+activity~variable,mean)
write.table(dataCast,file="clean-data-set-with-averages-for-each-sub-each-act.txt",sep=",")
