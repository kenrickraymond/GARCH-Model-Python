library(quantmod)
library(tseries)
library(timeSeries)
library(forecast)
library(xts)

getSymbols("JPM",
           src = "yahoo",
           from = "2010-01-01",
           to = "2021-07-23")

JPM_Close_Prices = JPM[,4]

par(mfrow = c(1,2))
Acf(JPM_Close_Prices, main = 'ACF for Differenced Series')
Pacf(JPM_Close_Prices, main = 'PACF for Differenced Series')

#Below .05
print(adf.test(JPM_Close_Prices))

auto.arima(JPM_Close_Prices, seasonal = FALSE)

fitA = auto.arima(JPM_Close_Prices, seasonal = FALSE)
tsdisplay(residuals(fitA), lag.max = 40, main = "(2,1,2) Model Residuals")
auto.arima(JPM_Close_Prices, seasonal = FALSE)

fitB = arima(JPM_Close_Prices, order = c(1,2,4))
tsdisplay(residuals(fitB), lag.max = 40, main = "(1,2,4) Model Residuals")

fitC = arima(JPM_Close_Prices, order = c(5,2,4))
tsdisplay(residuals(fitB), lag.max = 40, main = "(5,2,4) Model Residuals")

fitD = arima(JPM_Close_Prices, order = c(1,1,1))
tsdisplay(residuals(fitB), lag.max = 40, main = "(1,1,1) Model Residuals")

par(mfrow=c(2,2))

term <- 60
fcast1 <- forecast(fitA, h = term)
plot(fcast1)
fcast2 <- forecast(fitB, h = term)
plot(fcast2)
fcast3 <- forecast(fitC, h = term)
plot(fcast3)
fcast4 <- forecast(fitD, h = term)
plot(fcast4)

accuracy(fcast1)
accuracy(fcast2)
accuracy(fcast3)
accuracy(fcast4)