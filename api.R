library(plumber)

#* @apiTitle Sentiment Analysis API

#* @post /sentiment
#* @param text The text to analyze
#* @serializer json
function(text = "") {
  library(syuzhet)
  sentiment <- get_nrc_sentiment(text)
  list(sentiment = sentiment)
}

# Start the Plumber API
pr <- plumber::plumb("api.R")  # Make sure this file exists
pr$run(host = "0.0.0.0", port = 8000) 



git add api.R
git commit -m "Fixed api.R syntax error"
git push origin main