#Load Libraries
library(XML)
library(httr)
library(jsonlite)
install.packages("httpuv")

#create authentication
oauth_endpoints("github")

#create application
myapp <- oauth_app("github",
                   key = "f7f5ba9a5bb209a77a5f",
                   secret = "8ccf679aafacb74686e3f507111f839cebd51bdb")

#Get Oauth credentials
github_token <- oauth2.0_token(oauth_endpoints("github"),
                               myapp,
                               cache = FALSE)

#Open broswers and click authorize

# use API
gtoken <- config(token = github_token)
# begin webscraping
api_url <- "https://api.github.com/users/jtleek/repos"
# use GET to scrape webpage usng httr flow 
api_get <- GET(api_url, gtoken)
# GET content from api_get
api_content <- content(api_get, as="text")
api_htmlparse <- htmlParse(api_content, asText = TRUE) # htmlParse is from XML package
summary(api_htmlparse)

# create data.frame from api
df_api <- fromJSON(xpathSApply(api_htmlparse, "//body", xmlValue))
