---
title: "CodeBook"
author: "aduran9"
date: "29/9/2020"
output: html_document
---
## Introduction
The script run_analysis.R performs the 5 steps described in the course project's definition.

First, all the similar data is merged using the rbind() function. By similar, we address those files having the same number of columns and referring to the same entities.

Then, only those columns with the mean and standard deviation measures are taken from the whole dataset. After extracting these columns, they are given the correct names, taken from features.txt.

As activity data is addressed with values 1:6, we take the activity names and IDs from activity_labels.txt and they are substituted in the dataset.

On the whole dataset, those columns with vague column names are corrected.

Finally, we generate a new dataset with all the average measures for each subject and activity type (30 subjects * 6 activities = 180 rows). The output file is called FinalData.txt, and uploaded to this repository.

## Variables
x_train, y_train, x_test, y_test, subject_train and subject_test contain the data from the downloaded files.

x_data, y_data and subject_data merge the previous datasets to further analysis.

features contains the correct names for the x_data dataset, which are applied to the column names stored in "mean" and "std" features, a numeric vector used to extract the desired data.

A similar approach is taken with activity names through the activities variable.

"Merged_Data" merges x_data, y_data and subject_data in a big dataset.

Finally, "TidyData"" contains the relevant averages which will be later stored in a FinalData.txt file.

### Session Information
R version 4.0.2 (2020-06-22)
Platform: x86_64-w64-mingw32/x64 (64-bit)
Running under: Windows 10 x64 (build 19041)
Matrix products: default
locale:
[1] LC_COLLATE=Spanish_Mexico.1252 
[2] LC_CTYPE=Spanish_Mexico.1252   
[3] LC_MONETARY=Spanish_Mexico.1252
[4] LC_NUMERIC=C                   
[5] LC_TIME=Spanish_Mexico.1252    

attached base packages:
[1] stats     graphics  grDevices utils     datasets 
[6] methods   base     

loaded via a namespace (and not attached):
 [1] crayon_1.3.4     digest_0.6.25    dplyr_1.0.2     
 [4] R6_2.4.1         lifecycle_0.2.0  magrittr_1.5    
 [7] evaluate_0.14    pillar_1.4.6     rlang_0.4.7     
[10] ellipsis_0.3.1   vctrs_0.3.4      generics_0.0.2  
[13] rmarkdown_2.3    tools_4.0.2      glue_1.4.2      
[16] purrr_0.3.4      rsconnect_0.8.16 xfun_0.17       
[19] yaml_2.2.1       compiler_4.0.2   pkgconfig_2.0.3 
[22] htmltools_0.5.0  tidyselect_1.1.0 knitr_1.29      
[25] tibble_3.0.3
