# Course3Assigment1

## The step for Run_analysis.R:

1. Merges the training and the test sets to create one data set.
  + Set working location
  + Input data from txt file
  + Merge test and train Dataset
  
2. Extracts only the measurements on the mean and standard deviation for each measurement.
  + Select the measurement column with mean and standard deviation  
  + Extracts the selected column in MergeDataset
  
3. Uses descriptive activity names to name the activities in the data set 
  + Get the Selected Column Name 
  + replace -mean() to MEAN
  + replace -std() to STD
  + renmove the sybmols  ( ) - 
  
4. Appropriately labels the Exctracted dataset with descriptive variable names

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
  + use aggregate function
  
6. Final output txt file to submit
  + write.table with row.names = FALSE
