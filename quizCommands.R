# GitHub
# Client ID
# 2714efed73f7a1985e5c
# Client Secret
# 6aed8c6f69946eca2f79e3d341da42bb36bb91da

library(httr)
library(XML)

#Get the app
myapp <- oauth_app("github",key="2714efed73f7a1985e5c",secret = "9bedb0334d8898a6b7881653b7b62bafb83af267")

#Get the Token
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

#Config the token to make the request
gtoken <- config(token = github_token)

#Make the request, return value is request
req <- GET("https://api.github.com/users/jtleek/repos.json", gtoken)

#List of the elements in the request (HARD TO READ, I GOT STUCKED HERE)
req_List<-content(req)

#CONVERT TO A DATA FRAMEish thing
req_Json<-fromJSON(toJSON(req_List))

#FINISH: extract the attribute created_at from the row with name "datasharing"
req_Json[req_Json$name=="datasharing","created_at"][1]

##TODO: Check how to make this with Xpath...something like:
#req_HTML<-toHTML(req_List)
#xpathSApply(req_HTML,"//created_at[@name = 'datasharing']",xmlValue)
#COULDN'T MAKE THE CODE ABOVE WORK


