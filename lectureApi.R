#lecture API
library(httr)
library(jsonlite)
#KEY & SECRET
#this links my_App from the twitter app (the cascomio one)
myApp<-oauth_app(appname = "twitter",key = "V1GTppmCnq2Ig2bNMtd7axrfC",secret = "7bx7468nnyXP8ONv2iHwfyCUNept97jUXIzwwgDi7SRsZjjSPO")
#TOKEN & TOKEN SECRET
#this handles signature (right?)
sig <- sign_oauth1.0(app = myApp,token ="1379280313-vQ4bUJ5HblB1b5qyRCWjnvqoLoVMp8yToAkw6b1" ,token_secret = "VXOaZFTq7pTjf2Hu7A675UQbXLI3L0f8IsZbXCxRxbqig")

##check url examples from https://dev.twitter.com/rest/tools/console .
homeMENTS <-GET(url = "https://api.twitter.com/1.1/statuses/mentions_timeline.json",sig)
homeTL <-GET(url = "https://api.twitter.com/1.1/statuses/home_timeline",sig)
json1 <- content(homeTL)
##better Format
json2 <- fromJSON(toJSON(json1))

