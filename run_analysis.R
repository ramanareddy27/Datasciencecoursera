
#1 loading and merging data
X1<-read.table("C:/Users/RamanaMokilla/Documents/UCI HAR Dataset/test/X_test.txt")

X2<-read.table("C:/Users/RamanaMokilla/Documents/UCI HAR Dataset/train/X_train.txt")
data<-rbind(X1,X2)

Y1<-read.table("C:/Users/RamanaMokilla/Documents/UCI HAR Dataset/test/Y_test.txt")

Y2<-read.table("C:/Users/RamanaMokilla/Documents/UCI HAR Dataset/train/Y_train.txt")
y<-rbind(Y1,Y2)

S1<-read.table("C:/Users/RamanaMokilla/Documents/UCI HAR Dataset/test/subject_test.txt")
S2<-read.table("C:/Users/RamanaMokilla/Documents/UCI HAR Dataset/train/subject_train.txt")
subject<-rbind(S1,S2)
Activity_labels<-read.table("C:/Users/RamanaMokilla/Documents/UCI HAR Dataset/activity_labels.txt")
features_list<-read.table("C:/Users/RamanaMokilla/Documents/UCI HAR Dataset/features.txt")


#2 Extracting mean and standard deviation measurements for each measurement.

required_feature_numbers<-grep(".*mean\\(\\)|.*std\\(\\)",features_list[,2])
data<-data[,required_feature_numbers] #subsetting the data
names(data)<-gsub("\\()","",names(data))

#3activity description to the y
y[,1]=Activity_labels[y[,1],2]
names(y)<-"activity_name"

#4 adding subject number from where data is collected
names(subject)<-"subject_id"

#merged_tidy_data<-cbind(data,y,subject_id)

merged_tidy_data<-cbind(subject,y,data)
 # writing the tidy data as a text file

write.table(merged_tidy_data, "MergedTidyData.txt")

#5Creating a second, independent tidy data set with the average of each variable for each activity and each subject
total_subjects<-length(unique(subject)[,1])
total_activities<-length(Activity_labels[,1])
average_clean_data<-merged_tidy_data[1:(total_subjects*total_activities),]

#creating the new average clean data frame
r<-1
for(s in 1:total_subjects){
    for(a in total_activities){
      average_clean_data[r,1]<-unique(subject)[,1][s]
      average_clean_data[r,2]<-Activity_labels[a,2]
      t<-merged_tidy_data[merged_tidy_data$subject_id==s & merged_tidy_data$activity_name==Activity_labels[a,2],]
      average_clean_data[r,3:dim(merged_tidy_data)[2]]<-colMeans(t[,3:dim(merged_tidy_data)[2]])
      r<-r+1
    }
}

write.table(average_clean_data,"average_clean_data.txt")

