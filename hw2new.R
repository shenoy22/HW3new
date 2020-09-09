install.packages("foreign")
install.packages("haven")
install.packages("readr")
library(foreign)
library(haven)
library(readr)

#Q1

C1survery <- read_csv("https://raw.githubusercontent.com/kijohnson/ADA-FAll-2020/master/Class%20One/Class%201%20Survey%20Fall%202020.csv")

#Q2 no. of obs and variables

dim(C1survery)
[1] 32 27

# Q3 Renaming column names

colnames(C1survery)
names(C1survery)[1:27] <- c("id", "like.cats", "like.dogs", "desertstranded", "lifeslogan", "favweekday", 
                            "whichanimal", "favfood", "favdrink", "favseason", "favmonth", "hobby", "degreeprogram",
                            "specialization", "statsoftware", "rexperience", "codingcomfort", "codingexp", "whattolearn",
                            "interest", "favnum", "birthday", "birthmonth", "homecountry", "homestate", "homecity",
                            "highestedu")
colnames(C1survery)


[1] "id"             "like.cats"      "like.dogs"      "desertstranded" "lifeslogan"     "favweekday"    
[7] "whichanimal"    "favfood"        "favdrink"       "favseason"      "favmonth"       "hobby"         
[13] "degreeprogram"  "specialization" "statsoftware"   "rexperience"    "codingcomfort"  "codingexp"     
[19] "whattolearn"    "interest"       "favnum"         "birthday"       "birthmonth"     "homecountry"   
[25] "homestate"      "homecity"       "highestedu"  

# Q4 
table(sapply(C1survery,class))

character   numeric 
24         8 

#Q5a
summary (C1survery$birthday)

Length     Class      Mode 
32       character   character 

summary (C1survery$birthmonth)

Length     Class      Mode 
32       character character 

#Q5b
There are no missing values

#Q5c
C1survery$birthday_new <- as.numeric (C1survery$birthday)
class(C1survery$birthday_new)

[1] "numeric"

C1survery$birthmonth_new <- as.numeric (C1survery$birthmonth)
class(C1survery$birthmonth_new)

[1] "numeric"

median(C1survery$birthday_new, na.rm = TRUE)
[1] 17
median(C1survery$birthmonth_new, na.rm = TRUE)
[1] 8.5

#Q6

C1survery$bseason[C1survery$birthmonth_new == 12|C1survery$birthmonth_new == 1|
                  C1survery$birthmonth_new == 2] = "winter"
C1survery$bseason[C1survery$birthmonth_new == 3|C1survery$birthmonth_new == 4| 
                  C1survery$birthmonth_new == 5] = "spring"
C1survery$bseason[C1survery$birthmonth_new == 6|C1survery$birthmonth_new == 7| 
                  C1survery$birthmonth_new == 8] = "summer"
C1survery$bseason[C1survery$birthmonth_new == 9|C1survery$birthmonth_new == 10| 
                  C1survery$birthmonth_new == 11] = "fall"

table(C1survery$birthmonth_new, C1survery$bseason)

a <- table(C1survery$birthmonth_new, C1survery$bseason)
addmargins(a)

     fall spring summer winter Sum
1      0      0      0      1   1
3      0      2      0      0   2
4      0      1      0      0   1
5      0      3      0      0   3
6      0      0      3      0   3
7      0      0      2      0   2
8      0      0      2      0   2
9      4      0      0      0   4
10     4      0      0      0   4
11     2      0      0      0   2
12     0      0      0      4   4
Sum   10      6      7      5  28

#10 students born in fall, 6 in spring, 7 in summer, and 5 in winter.

#Q7 

#I want to know what is the mean level of R experience in the batch?
summary(C1survery$rexperience)

Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
1.000   1.000   2.000   2.125   3.000   5.000 

#On a scale of 1(none) to 5(advanced), the mean level of R exp is 2.1







