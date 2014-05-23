Code Book for the Course Project - Getting and Cleaning Data
========================================================

We use the following data 
        Human Activity Recognition Using Smartphones Dataset
        Version 1.0
        https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
        
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Further information regarding this data is extractable on unzipping the file (see README.txt).


We then perform several steps to tidy the data. Most importantly, we only use the mean and standard deviation of each measurement in the tidy data set and not all the columns of the origianal data. The column names of the tidy data set 
can be see in the end of this document.


The different steps that were performed to tidy the data.

Step 0: Read the data

Step 1: Merges the training and the test sets to create one data set.

        Combine the test and training data sets with the additional subject and activity columns.

Step 2: Extracts only the measurements on the mean and standard deviation for each measurement.         

        I extract data from column names that end with -mean() and -std(). I ignore data from 
        column names such as fBodyAcc-meanFreq(), because this is the weighted average of 
        the frequency components to obtain a mean frequency. And not mean in the sense implied here. 
        I thus obtain 66 columns from the original 561 columns.

Step 3: Uses descriptive activity names to name the activities in the data set

        I use the names given in the activity list to replace the integers, 
        i.e. 1 stands for walking, 2 for walking_upstairs etc.
        

Step 4: Appropriately labels the data set with descriptive activity names. 

        I rename the columns to facilitate readability. I personally don't find 
        the data names to be tidies now than before - but I follow the rules 
        given in the lecture notes, for example using full names.

Step 5: Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
        
        I create a tidy data set by aggregating the data of each variables for each activity and 
        each subject. 


The original variable names (left) and the new variable names (right) in the tidy data set. 


           original names              names in the tidy data set
         1 activity_labels             activity                                            
         2 subject                     subject                                             
         3 tBodyAcc-mean()-X           time.body.acceleration.mean.X                       
         4 tBodyAcc-mean()-Y           time.body.acceleration.mean.Y                       
         5 tBodyAcc-mean()-Z           time.body.acceleration.mean.Z                       
         6 tBodyAcc-std()-X            time.body.acceleration.std.X                        
         7 tBodyAcc-std()-Y            time.body.acceleration.std.Y                        
         8 tBodyAcc-std()-Z            time.body.acceleration.std.Z                        
         9 tGravityAcc-mean()-X        time.gravity.acceleration.mean.X                    
        10 tGravityAcc-mean()-Y        time.gravity.acceleration.mean.Y                    
        11 tGravityAcc-mean()-Z        time.gravity.acceleration.mean.Z                    
        12 tGravityAcc-std()-X         time.gravity.acceleration.std.X                     
        13 tGravityAcc-std()-Y         time.gravity.acceleration.std.Y                     
        14 tGravityAcc-std()-Z         time.gravity.acceleration.std.Z                     
        15 tBodyAccJerk-mean()-X       time.body.acceleration.jerk.mean.X                  
        16 tBodyAccJerk-mean()-Y       time.body.acceleration.jerk.mean.Y                  
        17 tBodyAccJerk-mean()-Z       time.body.acceleration.jerk.mean.Z                  
        18 tBodyAccJerk-std()-X        time.body.acceleration.jerk.std.X                   
        19 tBodyAccJerk-std()-Y        time.body.acceleration.jerk.std.Y                   
        20 tBodyAccJerk-std()-Z        time.body.acceleration.jerk.std.Z                   
        21 tBodyGyro-mean()-X          time.body.gyro.mean.X                               
        22 tBodyGyro-mean()-Y          time.body.gyro.mean.Y                               
        23 tBodyGyro-mean()-Z          time.body.gyro.mean.Z                               
        24 tBodyGyro-std()-X           time.body.gyro.std.X                                
        25 tBodyGyro-std()-Y           time.body.gyro.std.Y                                
        26 tBodyGyro-std()-Z           time.body.gyro.std.Z                                
        27 tBodyGyroJerk-mean()-X      time.body.gyro.jerk.mean.X                          
        28 tBodyGyroJerk-mean()-Y      time.body.gyro.jerk.mean.Y                          
        29 tBodyGyroJerk-mean()-Z      time.body.gyro.jerk.mean.Z                          
        30 tBodyGyroJerk-std()-X       time.body.gyro.jerk.std.X                           
        31 tBodyGyroJerk-std()-Y       time.body.gyro.jerk.std.Y                           
        32 tBodyGyroJerk-std()-Z       time.body.gyro.jerk.std.Z                           
        33 tBodyAccMag-mean()          time.body.acceleration.magnitude.mean               
        34 tBodyAccMag-std()           time.body.acceleration.magnitude.std                
        35 tGravityAccMag-mean()       time.gravity.acceleration.magnitude.mean            
        36 tGravityAccMag-std()        time.gravity.acceleration.magnitude.std             
        37 tBodyAccJerkMag-mean()      time.body.acceleration.jerk.magnitude.mean          
        38 tBodyAccJerkMag-std()       time.body.acceleration.jerk.magnitude.std           
        39 tBodyGyroMag-mean()         time.body.gyro.magnitude.mean                       
        40 tBodyGyroMag-std()          time.body.gyro.magnitude.std                        
        41 tBodyGyroJerkMag-mean()     time.body.gyro.jerk.magnitude.mean                  
        42 tBodyGyroJerkMag-std()      time.body.gyro.jerk.magnitude.std                   
        43 fBodyAcc-mean()-X           frequency.body.acceleration.mean.X                  
        44 fBodyAcc-mean()-Y           frequency.body.acceleration.mean.Y                  
        45 fBodyAcc-mean()-Z           frequency.body.acceleration.mean.Z                  
        46 fBodyAcc-std()-X            frequency.body.acceleration.std.X                   
        47 fBodyAcc-std()-Y            frequency.body.acceleration.std.Y                   
        48 fBodyAcc-std()-Z            frequency.body.acceleration.std.Z                   
        49 fBodyAccJerk-mean()-X       frequency.body.acceleration.jerk.mean.X             
        50 fBodyAccJerk-mean()-Y       frequency.body.acceleration.jerk.mean.Y             
        51 fBodyAccJerk-mean()-Z       frequency.body.acceleration.jerk.mean.Z             
        52 fBodyAccJerk-std()-X        frequency.body.acceleration.jerk.std.X              
        53 fBodyAccJerk-std()-Y        frequency.body.acceleration.jerk.std.Y              
        54 fBodyAccJerk-std()-Z        frequency.body.acceleration.jerk.std.Z              
        55 fBodyGyro-mean()-X          frequency.body.gyro.mean.X                          
        56 fBodyGyro-mean()-Y          frequency.body.gyro.mean.Y                          
        57 fBodyGyro-mean()-Z          frequency.body.gyro.mean.Z                          
        58 fBodyGyro-std()-X           frequency.body.gyro.std.X                           
        59 fBodyGyro-std()-Y           frequency.body.gyro.std.Y                           
        60 fBodyGyro-std()-Z           frequency.body.gyro.std.Z                           
        61 fBodyAccMag-mean()          frequency.body.acceleration.magnitude.mean          
        62 fBodyAccMag-std()           frequency.body.acceleration.magnitude.std           
        63 fBodyBodyAccJerkMag-mean()  frequency.body.body.acceleration.jerk.magnitude.mean
        64 fBodyBodyAccJerkMag-std()   frequency.body.body.acceleration.jerk.magnitude.std 
        65 fBodyBodyGyroMag-mean()     frequency.body.body.gyro.magnitude.mean             
        66 fBodyBodyGyroMag-std()      frequency.body.body.gyro.magnitude.std              
        67 fBodyBodyGyroJerkMag-mean() frequency.body.body.gyro.jerk.magnitude.mean        
        68 fBodyBodyGyroJerkMag-std()  frequency.body.body.gyro.jerk.magnitude.std 

