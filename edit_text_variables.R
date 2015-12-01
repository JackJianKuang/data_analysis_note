if (!file.exists("./data")) {
    dir.create("./data")
}
fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl, destfile = "./data/cameras.csv")
cameraData <- read.csv("./data/cameras.csv")

# Fixing character vectors

## tolower(), toupper()
names(cameraData)
# [1] "address"      "direction"    "street"       "crossStreet"  "intersection"
# [6] "Location.1"
tolower(names(cameraData))
# [1] "address"      "direction"    "street"       "crossstreet"  "intersection"
# [6] "location.1"  

## strsplit()
splitNames = strsplit(names(cameraData), "\\.")
splitNames[[5]]
# [1] "intersection"
splitNames[[6]]
# [1] "Location" "1" 

## sapply()
splitNames[[6]][1]
# [1] "Location"
firstElement <- function(x){x[1]}
sapply(splitNames, firstElement)
# [1] "address"      "direction"    "street"       "crossStreet"  "intersection"
# [6] "Location"

## sub()
