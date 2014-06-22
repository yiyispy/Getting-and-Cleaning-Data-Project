
The run_analysis.R performs according to the following steps.
_____________
     

### 1. Merges the training and the test sets to create one data set.
   1. Read the”features.txt”, to read the list of features’ name.
   1.  Attributes variables’ label to “X_train”，“subject_train”，“ y_train”  
   1. Combine“X_train”，“subject_train”，“ y_train”to”train_set”
   1. Attributes variables’ label to ”X_test”,“subject_test”，“ y_test”
   1. Combine”X_test”,“subject_test”，“ y_test”to”test_set”
   1. Combine “train_set”and”test_set”to”data_set” 


     
### 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
   2. Find out which names include target strings including ”-mean” and “-std”
   2. Subset target data set by selecting method
   2. Combine the subset with “subject” and “activity” with right names
    

     
### 3. Uses descriptive activity names to name the activities in the data set
   3. Replace the 1-6 numbers in data_set_3$activity with appropriate names of activity according to “activity_labels.txt”
   
     

### 4. Appropriately labels the data set with descriptive variable names. 
   4. Extract the old names of variables from the merged data set
   4. Use regular expressions and “sub()” function to update the names to more descriptive ones
   4. Replace the variables’ names with the updated vector of names in the merged data set


 
### 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
   5. Melt the merged data set with the id of “subject” and “activity”
   5. Then “dcast()" the melted data where as calculating the mean of each variables in the data set
   5. write the latest data set to a txt file called "clean-data-set-with-averages-for-each-sub-each-act.txt”


