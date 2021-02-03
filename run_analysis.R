library(dplyr)
X <- rbind(x_train, x_test)
Y <- rbind(y_train, y_test)
Subject <- rbind(subject_train, subject_test)
subject_Data_unida <- cbind(Subject, Y, X)

MyTidyData <- select(subject_Data_unida,subject, code, contains("mean"), contains("std"))

MyTidyData$code <- activity_labels[MyTidyData$code, 2]

names(MyTidyData)[2] = "activity"
names(MyTidyData)<-gsub("Acc", "Accelerometer", names(MyTidyData))
names(MyTidyData)<-gsub("Gyro", "Gyroscope", names(MyTidyData))
names(MyTidyData)<-gsub("BodyBody", "Body", names(MyTidyData))
names(MyTidyData)<-gsub("Mag", "Magnitude", names(MyTidyData))
names(MyTidyData)<-gsub("^t", "Time", names(MyTidyData))
names(MyTidyData)<-gsub("^f", "Frequency", names(MyTidyData))
names(MyTidyData)<-gsub("tBody", "TimeBody", names(MyTidyData))
names(MyTidyData)<-gsub("-mean()", "Mean", names(MyTidyData), ignore.case = TRUE)
names(MyTidyData)<-gsub("-std()", "STD", names(MyTidyData), ignore.case = TRUE)
names(MyTidyData)<-gsub("-freq()", "Frequency", names(MyTidyData), ignore.case = TRUE)
names(MyTidyData)<-gsub("angle", "Angle", names(MyTidyData))
names(MyTidyData)<-gsub("gravity", "Gravity", names(MyTidyData))

FinalData <- group_by(MyTidyData, subject, activity)
FinalData <- summarise_all(FinalData, funs(mean))
write.table(FinalData, "FinalData.txt", row.name=FALSE)
