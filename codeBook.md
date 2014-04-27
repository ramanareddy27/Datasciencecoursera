This document describes the steps involved in the script run_analysis.R at an abstract level.

1) records from the training and testing data files x_test.txt,x_train.txt,Y_test.txt,y_train.txt, subject_test.txt,subject_train.txt are loaded and merged into a respective single tables.

2)features_list and activity_labels are also loaded into tables.

3) Mean and standard values of all the variables are seperated and the data is subsetted which is a merger of x_test and X-train data.

4) Descriptive labels are binding along the column of data , training labels and subject id's.

5) the data is written to afile caled merger_tidy_data.txt.

6) To find the independent tidy data set with the average of each variable for each activity and each subject..
  i) for each unique subject_id, and for each activity of the unique subject_id all the variables are sorted and the mean value is taken.
  ii) The average_clean_data is the table of means of each variable for each activity for each subject.


The table is represented similar to this
subject_id  activity variables......
2-----------walking-----mean values of all variables
2-----------walking_upstairs--mean values of all variables
2-----------walking_downstairs--mean values of all variables
2-----------sitting--mean values of all variables
2-----------standing--mean values of all variables
2-----------laying--mean values of all variables

