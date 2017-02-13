library('zoo')
library('forecast') 

setwd("D:\\韩晓宇\\workspace\\自学\\tianchi")

in_file_name <- 'shop_without_last_week_pays_without_0'
out_file_name <- paste('predict_', in_file_name, sep='')

f <- file(in_file_name, open='rt')
text <- readLines(f)

for (i in seq_len(2000)) {
  vec <- strsplit(text[i], ',')
  fit <- auto.arima(as.integer(unlist(vec)))
  result <- plot(forecast(fit, h=14))
  write.table(result[1], out_file_name, append=TRUE)
  print(i)
}

close(f)