# 1. Merges the training and the test sets to create one data set.

        # Download the zip file from the following address
        # https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
        # Unzip the file to the following location
                setwd("C:/Users/OLKaE/Desktop/DataScienceCourse/Data_Cleaning/Assignment 1/UCI HAR Dataset")
        
        # Input data from txt file
                features <- read.table("features.txt", col.names = c("column","featuresLabel"))
                activity_labels <- read.table("activity_labels.txt", col.names = c("ActivityID","ActivityLabel"))
        
                subject_test <- read.table("./test/subject_test.txt", col.names = "SubjectID")
                y_test <- read.table("./test/y_test.txt", col.names = "ActivityID")
                X_test <- read.table("./test/X_test.txt")
        
                subject_train <- read.table("./train/subject_train.txt", col.names = "SubjectID")
                y_train <- read.table("./train/y_train.txt", col.names = "ActivityID")
                X_train <- read.table("./train/X_train.txt")

        # Merge test and train Dataset
                Dataset_test = cbind(subject_test, y_test , X_test)
                Dataset_train = cbind(subject_train, y_train , X_train)
                MergeDataset <- rbind(Dataset_train, Dataset_test)    
                
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
        
        # Select the measurement column with mean and standard deviation   
                SelectColumn <- grep(".*mean\\(\\).*|.*std\\(\\).*", features$featuresLabel)
        
        # Extracts the selected column in MergeDataset
                ExtractDataSet <- MergeDataset[, c(1,2,SelectColumn+2)]  # plus 2 because the 2 column is subjectID and ActivietyID
         
# 3. Uses descriptive activity names to name the activities in the data set                
        
        # Get the Selected Column Name 
                SelectColumnName <- grep(".*mean\\(\\).*|.*std\\(\\).*", features$featuresLabel,value = TRUE)
        # replace -mean() to MEAN
                SelectColumnName2 <- gsub("\\-mean\\(\\)", "MEAN", SelectColumnName)
        # replace -std() to STD
                SelectColumnName3 <- gsub("\\-std\\(\\)", "STD", SelectColumnName2)
        # renmove the sybmols  ( ) - 
                descriptiveName <- gsub("[()-]", "", SelectColumnName3)
                
                
# 4. Appropriately labels the Exctracted dataset with descriptive variable names            
                colnames(ExtractDataSet) <- c("SubjectID","ActivityID", descriptiveName)

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
                AVGvardataset <- aggregate(ExtractDataSet, by=list(ExtractDataSet$SubjectID,ExtractDataSet$ActivityID), mean)[,c(-1,-2)]

# 6. Final output txt file to submit
                write.table(AVGvardataset, "tidydataset.txt", row.names = FALSE)                

                