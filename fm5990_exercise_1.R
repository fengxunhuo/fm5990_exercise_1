setwd("D:/Documents/University Life/Graduate/Year1/FM5990/R/Second Lecture")

library(tidyverse)
library(ggplot2)

df_option_intro = read.csv("data_options_intro.csv")

strike = df_option_intro$strike
implied_vol = df_option_intro$implied_vol
askpx = df_option_intro$ask

len = nrow(df_option_intro)


distinct(df_option_intro, expiration)
distinct(df_option_intro, trade_date)

df_option_intro %>% distinct(underlying)

df_SPY <- filter(df_option_intro, underlying == "SPY")
df_QQQ <- filter(df_option_intro, underlying == "IWM")
df_IWM <- filter(df_option_intro, underlying == "QQQ")
df_DIA <- filter(df_option_intro, underlying == "DIA")


qplot(strike, implied_vol, data = df_SPY, main = "SPY")
qplot(strike, implied_vol, data = df_QQQ, main = "QQQ")      
qplot(strike, implied_vol, data = df_IWM, main = "IWM")
qplot(strike, implied_vol, data = df_DIA, main = "DIA")

cor.test(df_DIA$strike, df_DIA$implied_vol)


df_SPY_puts <- filter(df_SPY, type == "put")
df_SPY_calls <- filter(df_SPY, type == "call")
nrow(df_SPY_puts)
nrow(df_SPY_calls)

qplot(strike, bid, data = df_SPY_calls, main = "calls",
      ylab = "bid_price")
qplot(strike, bid, data = df_SPY_puts, main = "puts", 
      ylab = "bid_price")












