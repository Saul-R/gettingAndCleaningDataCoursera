# GitHub
# Client ID
# 2714efed73f7a1985e5c
# Client Secret
# 6aed8c6f69946eca2f79e3d341da42bb36bb91da

library(httr)
myApp<-oauth2.0_token(endpoint = oauth_endpoints("github"),
                      app = oauth_app(appname = "github",
                                      key = "2714efed73f7a1985e5c",
                                      secret = "6aed8c6f69946eca2f79e3d341da42bb36bb91da"),
                      
                      )

                      