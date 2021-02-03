The run_analysis.R performs some of the data preparation and then followed by the 5 steps required:
     1. Merges the training and the test sets to create one data set.
     2. Extracts only the measurements on the mean and standard deviation for each measurement.
     3. Uses descriptive activity names to name the activities in the data set
     4. Appropriately labels the data set with descriptive variable names.
     5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Downoload and declare the new variables:

  1. The first thing done was to download the documents from the link presented in the course project guide and making a new folder called: UCI HAR Dataset, those steps are included in the firststep script, with the commands to save the file and unzip it.

  2. With the README files in the folder after unzip, the names for the tables are clear, decided to go with the same name of the files because it make consistent the tables with the information given by the explanation files:
     a. features <- features.txt, all features selected for this database are from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.
     b. activity_labels <- activity_labels.txt, is the list of activities performed when the corresponding measurements were taken and its codes (labels).
     c. subject_test <- test/subject_test.txt, contains test data of 9/30 volunteer test subjects being observed.
     d. x_test <- test/X_test.txt, contains recorded features test data.
     e. y_test <- test/y_test.txt, contains test data of activities’code labels.
     f. subject_train <- test/subject_train.txt, contains train data of 21/30 volunteer subjects being observed.
     g. x_train <- test/X_train.txt, contains recorded features train data.
     h. y_train <- test/y_train.txt, contains train data of activities’code labels.

Merging:
The run_analysis.R script begins opening the library(dplyr) that is going to allow us to use important functions.
Then the variable X and Y are created using the rbind() function that allows us to join x_train, x_test and y_train, y_test respectively.
Using the same process as above we create the variable Subject but now using rbind() function with subject_test and subject_train.
With X, Y and Subject we create the table subject_Data_unida using cbind() function to Merge

Extraction:
Using the function select of dplyr package, we select from subject_Data_unida the columns: subject, code and with the word contains the measurement of mean and standard deviation putting it in a new variable called MyTidyDataset

Descriptive Names:
From MyTidyDataset we select the number of code an replace it with the name of activity from the activity_labels dataset

After this all of the columns are renamed from the abbrevation of words. e.d.s, and this makes it more understandable using gsub() function
Acc in column’s name replaced by Accelerometer.
Gyro in column’s name replaced by Gyroscope.
BodyBody in column’s name replaced by Body.
Mag in column’s name replaced by Magnitude.
if the column starts with character f in column’s name replaced by Frequency using regular expressions to find the character.
if the column starts with character t in column’s name replaced by Time using regular expressions to find the character.

Exporting:
With the function summarise_all() we take the mean of each variable and put it in a new dataset called FinalData and export that data to a txt file
