#quiz 1
## Question 1
###The American Community Survey distributes downloadable data about United States communities. Download the 2006 microdata survey about housing for the state of Idaho using download.file() from here:
###https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv
###and load the data into R. The code book, describing the variable names is here:
###https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf
###How many properties are worth $1,000,000 or more? 

library(RCurl)
myHTTPS<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
acs<-readCSVFromHTTPS(myHTTPS)
sum(acs$VAL == 24,na.rm = T)

## Question 2
###Use the data you loaded from Question 1. Consider the variable FES in the code book.
###Which of the "tidy data" principles does this variable violate? 
###ANSWER:*Tidy data has one variable per column.*

# Question 3
###Download the Excel spreadsheet on Natural Gas Aquisition Program here:
###https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx
###Read rows 18-23 and columns 7-15 into R and assign the result to a variable called:
### dat 
###What is the value of:
### sum(dat$Zip*dat$Ext,na.rm=T) 

####NOTE I had to install rJava and threw errors until I installed sudo apt-get install liblzma-dev

library(xlsx)
library(downloader)
download(url = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx","nga.xlsx")
dat<-read.xlsx(file = "nga.xlsx",startRow = 18,endRow = 23,colIndex = 7:15,sheetIndex = 1)
sum(dat$Zip*dat$Ext,na.rm=T)


#Question 4
###Read the XML data on Baltimore restaurants from here:
###https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml
###How many restaurants have zipcode 21231? 

library(XML)
myXml<-getURL(url = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml")
treeXml <- xmlTreeParse(myXml,useInternalNodes = T)
####USE INTERNAL NODES IS NECESSARY http://stackoverflow.com/questions/24118546/unable-to-find-an-inherited-method-for-function-savexml-for-signature-charac
myxmlRoot <- xmlRoot(treeXml)
zipcodes<-xpathSApply(myxmlRoot,"//zipcode",xmlValue)
sum(zipcodes==21231)

###Question 5
###The American Community Survey distributes downloadable data about United States communities. Download the 2006 microdata survey about housing for the state of Idaho using download.file() from here:
###https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv
###using the fread() command load the data into an R object
### DT 
###Which of the following is the fastest way to calculate the average value of the variable
###pwgtp15 
###broken down by sex using the data.table package? 
library(data.table)
download("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv","acs.csv")
DT<-fread("acs.csv")
###SOLUTION
DT[,mean(pwgtp15),by=SEX]

