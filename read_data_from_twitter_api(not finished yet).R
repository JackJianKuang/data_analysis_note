# access twitter from R
install.packages("base64enc")
library(base64enc)
myapp <- oauth_app("twitter", key = "i4ok8o76HbcV1nTv98THUyAx9", secret = "qXsMKBDKTWXlUmWOoQIA3hrWzPzszw600nHJSqA4GFgfyN1qSk")
sig <- sign_oauth1.0(myapp, token = "2413721412-t0GOC7rW8IWZYatKJ6Bd5x4Mo1hhhs1EyW6lhNa", token_secret = "JmcoLir2cDo7tHokX3M9e9juv8EysavGqctrtAPhDcBZe")
# need 'base64enc' library
homeTL <- GET("https://api.twitter.com/1.1/statuses/home_timeline.json", sig)
