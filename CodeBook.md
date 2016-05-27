The file describes the variables used in file run_analysis.R

activity_labels: Data frame that contains the data in file activity_labels.txt. The variables are the activity_id, and activity_name

features: Data frame that contains the data in the features.txt file. The variable contained are the feature_id, and feature_name

test_x: Data frame that contains the data in x_test.txt. After processing the data frame is enhanced with subject_id, activity_id.
        Also, the variables that refer to mean and std features are renamed according to the features data frame

train_x: Data frame that contains the data in x_train.txt. After processing the data frame is enhanced with subject_id, activity_id.
        Also, the variables that refer to mean and std features are renamed according to the features data frame  
        
test_train_x: Data frame that includes information for both test_x and train_x and includes only the variables that we are interested in 
              (subject_id, activity_id, activity_name, and the mean and std measures)
              
test_train_group: Data frame that consists of the mean for each of the measures included in test_train_x data frame per subject_id, and 
                  activity_id
