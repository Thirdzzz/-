setwd("D:\\韩晓宇\\workspace\\自学\\tianchi")
#shop_pay_data <- read.table("./shop_pays", sep=",", header=FALSE)
in_file_name <- 'shop_without_last_week_pays_without_0'
out_file_name <- paste('predict_', in_file_name, sep='')
library(xlsx)
shop_pay_data <- read.xlsx(in_file_name, sep=",", header=FALSE)
#head(shop_pay_data)
dim(shop_pay_data)
library(reshape)
shop_matrix_data <- data.matrix(shop_pay_data)
#shop_without_last_week <- shop_pay_data[,3:476]
#write.table(shop_without_last_week, 'shop_without_last_week_pays')
dim <- dim(shop_matrix_data)
library('zoo')
library('forecast') 
for (i in seq_len(2000)) {
  #shop_data = shop_matrix_data[i,2:490]
  shop_data = shop_matrix_data[i,2:dim[2]]
  fit <- auto.arima(shop_data)
  result <- plot(forecast(fit, h=14))
  #write.table(result[1], 'auto_arima_result_without', append=TRUE)
  write.table(result[1], out_file_name, append=TRUE)
  print(i)
}