# install.packages("base64enc") # I already installed 
library(base64enc) # tools for base64 encoding
library(httr) # we need to use authentication functions (oauth) in httr library
library(jsonlite) # fromJSON and toJSON function

# access twitter from R
myapp <- oauth_app("twitter", key = "i4ok8o76HbcV1nTv98THUyAx9", secret = "qXsMKBDKTWXlUmWOoQIA3hrWzPzszw600nHJSqA4GFgfyN1qSk")
sig <- sign_oauth1.0(myapp, token = "2413721412-t0GOC7rW8IWZYatKJ6Bd5x4Mo1hhhs1EyW6lhNa", token_secret = "JmcoLir2cDo7tHokX3M9e9juv8EysavGqctrtAPhDcBZe")
# need 'base64enc' library
# How did I know what url to use? (https://dev.twitter.com/rest/reference/get/statuses/home_timeline)
homeTL <- GET("https://api.twitter.com/1.1/statuses/home_timeline.json", sig)

# converting the json object
json1 <- content(homeTL)
json2 <- jsonlite::fromJSON(toJSON(json1))
json2[1,1:4]

# In general look at the documentation of Twitter REST APIs (https://dev.twitter.com/rest/public)
