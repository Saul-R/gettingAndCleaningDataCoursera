getFileHTTPS <- function(httpsURL){
  library(RCurl)
  myCsv <- getURL(httpsURL)
  temporaryFile <- tempfile()
  ##temporaryFile <- file.create(filename = "")
  con <- file(temporaryFile, open = "w")
  cat(myCsv, file = con)
  con
}