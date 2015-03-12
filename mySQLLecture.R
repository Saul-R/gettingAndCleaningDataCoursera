
library(RMySQL)
##dbConnect works for many other db other than MySQL. 
ucscDb<-dbConnect(MySQL(),user= "genome",host="genome-mysql.cse.ucsc.edu")
## User and host required from http://genome.ucsc.edu/goldenPath/help/mysql.html
## This variable is the handle.

##Statement is the mySQL query
databases<-dbGetQuery(conn = ucscDb,statement = "SHOW DATABASES")
dbDisconnect(conn = ucscDb)
##error: schema<-dbGetQuery(conn = ucscDb,statement = "SELECT * FROM information_schema")
##correcto:
