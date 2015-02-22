# List of all variables used in run_analysis.r

file: a string that has file location info to be used next

x_test: a dataframe that contains all measurments of test observations

y_test: a dataframe that contains activity codes of test observations

subject_test: a dataframe that contains subject identifier of test observations

x_train: a dataframe that contains all measurments of training observations

y_train: a dataframe that contains activity codes of training observations

subject_train: a dataframe that contains subject identifier of training observations

features: a dataframe that contains the list of all features

act_labels: a dataframe that contains the description of activities

tests_set: a dataframe that combines subject_test,y_test,and X_test

training_set: a dataframe that combines subject_train,y_train,and X_train

whole_data: a dataframe that combines test_set and training_set

mean_index: a vector that contains index info for those measurements that has "mean()" in their names

std_index: a vector that contains index info for those measurements that has "std()" in their names


columns_index: a vector that contains unique index info in mean_index and std_index, use to extract the required columns in whole_data
Step4_data: a dataframe that contains the dataset after completion of step 1 to step 4
Tidy_dataMelt: Melted Step4_data with id set to be Subject and Activity
Tidy_dataset: a dataframe that contains the dataset after completion of step 5