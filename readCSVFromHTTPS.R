readCSVFromHTTPS <- function(httpsURL){
  library(RCurl)
  myCsv <- getURL(httpsURL)
  temporaryFile <- tempfile()
  con <- file(temporaryFile, open = "w")
  cat(myCsv, file = con) 
  close(con)

  read.csv(temporaryFile)
}