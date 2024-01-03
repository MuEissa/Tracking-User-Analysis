# Tracking User Engagement

An educational platform was expecting a profitability increase in the second quarter of 2022 due to the recently added features and enhancements. Added features included expansion in the course library, enrollment in career tracks, and exams to assess one's knowledge at different stages of the learning journey throughout the courses and later. 

The raw dataset was provided as an SQL script. Due to the nature of the data, that it was related to real users, the analysis approach was not focused on insights derived from visualizations at the final stages, but rather a more statistical approach, where I was able to utilize the analysis toolpak provided in Excel. 
Desired datasets were retrieved from the raw set using the provided SQL scripts. The goal was to split data into groups based on their subscription and the year. 

Statistical metrics such as the mean value can be dramatically affected by outliers in the datasets. Here is where Python took place to remove the outliers from the dataset, regenerating the clean dataset files. 

We got the data and the questions to be answered. It is time to summon the beast, Excel. All datasets were loaded into Excel, along with a set of descriptive statistics calculated for each group. 

## Conclusion? 
 - There is a strong positive correlation between the minutes of content watched and the number of issued certificates, suggesting that students who consume more content tend to obtain more certificates, the thing that sounds intuitive. 
 - There has been an increase in student engagement for the free-plan student from 2021 to 2022.
 - Subscribed students watch significantly more minutes than their peers without.
 - For the paying students, the case was counter to what has been with the free-plan students. There is a decrease in engagement in 2022 compared to 2021.
 - While the t-statistical tests provided compelling evidence to reject the null hypothesis for the free-plan group, they fell short of establishing sufficient support to accept the alternative hypothesis for this group. Similarly, the tests did not yield adequate evidence to reject the null hypothesis for the subscribed student group.

## Please refer to the attached docs for the scripts and visuals 

