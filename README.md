This is the Final project for the course Getting and cleaning data in the platform Coursera, presented by Paula Trejos. In this document i present a series of instrunctions in the way to hanlde the information. 

Data Set: Found in 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones Data collectd form accelerometers from the Samsung Galaxy S smartphone.

This repository contains 4 Files besides this one:

1. Codebook.md: Tis document is where i explicit tell the steps apllied to the raw data set to obtain the tidy data set, the pareparation and the explanation for the variables.

2. firststep.R: Explained in the codebook

3. run_analysis.R: Performs the data preparation and then followed by the 5 steps required:

   a. Merges the training and the test sets to create one data set.
   
   b. Extracts only the measurements on the mean and standard deviation for each measurement.
  
   c. Uses descriptive activity names to name the activities in the data set.
   
   d. Appropriately labels the data set with descriptive variable names.
   
   e. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
  
4. FinalData.txt: is the exported final data after going through all the sequences described above.
