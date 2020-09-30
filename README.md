---
title: "CodeBook"
author: "aduran9"
date: "29/9/2020"
output: html_document
---
## Introduction
The script run_analysis.Rperforms the 5 steps described in the course project's definition.

First, all the similar data is merged using the rbind() function. By similar, we address those files having the same number of columns and referring to the same entities.

Then, only those columns with the mean and standard deviation measures are taken from the whole dataset. After extracting these columns, they are given the correct names, taken from features.txt.

As activity data is addressed with values 1:6, we take the activity names and IDs from activity_labels.txt and they are substituted in the dataset.

On the whole dataset, those columns with vague column names are corrected.

Finally, we generate a new dataset with all the average measures for each subject and activity type (30 subjects * 6 activities = 180 rows). The output file is called averages_data.txt, and uploaded to this repository.

## Variables
train_x, train_y, test_x, test_y, train_s and test_s contain the data from the downloaded files.
X, Y and Subject data merge the previous datasets to further analysis.
features contains the correct names for the X dataset, which are applied to the column names stored in mean_and_std_features, a numeric vector used to extract the desired data.
A similar approach is taken with activity names through the activities variable.
all_data merges X, Y and Subject in a big dataset cbind().

Finally, averages_data contains the relevant averages which will be later stored in a .txt file.

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
[1] stats     graphics  grDevices utils     datasets  methods  
[7] base     

other attached packages:
[1] dplyr_1.0.2

loaded via a namespace (and not attached):
 [1] knitr_1.29       magrittr_1.5     tidyselect_1.1.0
 [4] R6_2.4.1         rlang_0.4.7      fansi_0.4.1     
 [7] stringr_1.4.0    tools_4.0.2      xfun_0.17       
[10] utf8_1.1.4       cli_2.0.2        selectr_0.4-2   
[13] htmltools_0.5.0  ellipsis_0.3.1   yaml_2.2.1      
[16] digest_0.6.25    assertthat_0.2.1 tibble_3.0.3    
[19] lifecycle_0.2.0  crayon_1.3.4     purrr_0.3.4     
[22] vctrs_0.3.4      rsconnect_0.8.16 glue_1.4.2      
[25] evaluate_0.14    rmarkdown_2.3    stringi_1.5.3   
[28] compiler_4.0.2   pillar_1.4.6     generics_0.0.2  