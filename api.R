library(plumber)
library(syuzhet)

#* @post /sentiment
#* @param text The text for sentiment analysis
#* @serializer json
function(text) {
  sentiment <- get_nrc_sentiment(text)
  return(sentiment)
}

r <- plumb("api.R")
r$run(host = "0.0.0.0", port = as.numeric(Sys.getenv("PORT", 8000)))
