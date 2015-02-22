# GettingCleaningData_Project
##This repo contains the files for Coursera--Getting &amp; Cleaning Data course project
=======================================================================================
Project Source Data Download link: (Please unzip to your R working directory)
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

## * Project Goal
    From the downloaded source data:
	1. Merges the training and the test sets to create one data set.
	2. Extracts only the measurements on the mean and standard deviation for each measurement. 
	3. Uses descriptive activity names to name the activities in the data set
	4. Appropriately labels the data set with descriptive variable names. 
	5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
	6. Output a text file contains the final tidy data set created in step 5

## * This repo includes the following files:
	1. README.md: General info about this repo
	2. run_analysis.r: R script for performing the project goal
	3. CodeBook.md: List of all variables used in run_analysis.r
	4. Tidy_dataset.txt: Output file of run_analysis.r