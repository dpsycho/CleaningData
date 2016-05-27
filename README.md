# CleaningData
Contains code and information for the Cursera Getting and Cleaning data course

The code is included in the run_analysis.R file, also included in this repository. A brief description of the steps followed in the code follows:

Step 1. 
The code begins with loading the dplyr package, and setting the working directory.

Step 2.
Then, the information in activity_labels.txt and features.txt is loaded in activity_labels and features data frames, and the variables are renamed to more descriptive ones

Step 3.
Reads the  x_test.txt , y_test.txt, subject_test.txt in respective data frames (test_x, test_y, test_subject), and adds the subject_id and activity_id information in test_x data frames which contains the measures.

Step 4.
Similar as Step 3 for training set

Step 5.
Using the features data frame renames the variables that we are interested in (containing mean or std) in test_x and train_x with the feature name. 

Step 6.
Merges the two data frames, test_x and test_y, selecting only the variables we are interested in (mean, std, subject_id, activity_id), and also using the dplyr merge, enhances the information by appending the activity_label found in activity_labels data frame. The resulted data are inserted in test_train_x data frame.

Step 7.
The data in test_train_x data frame are grouped by subject_id,activity_id, activity_name, and summarised using mean function on every measure. The process is using pipelines and the resulted set is inserted in test_train_group data frame




