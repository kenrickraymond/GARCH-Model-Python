library(quantmod)
library(xts)
library(PerformanceAnalytics)
library(rugarch)

getSymbols("JPM",
           src = "yahoo",
           from = "2000-01-01",
           to = "2021-07-13")
chartSeries(JPM)

return <- CalculateReturns(JPM$JPM.Close)
return <- return[-1]
hist(return)
chart.Histogram(return, 
                methods = c("add.density", "add.normal"),
                colorset = c("black", "blue", "red"))
legend("topright", c("Returns", "Density", "Normal Distribution"), col=c("black", "blue", "red"), lwd=10)

chartSeries(return, 
            theme = "white",
            legend = "")

addTA(EMA(Cl(JPM)), legend = "")

#Annualized Volatility
sd(return)
sqrt(252) * sd(return["2019"])
chart.RollingPerformance(R = return["2000::2021"],
                         width =22,
                         scale = 252,
                         FUN = sd.annualized,
                         main = "APPLE's Monthly Rolling Volatility")

#sGARCH with const mean
s <- ugarchspec(mean.model = list(armaOrder = c(0,0)),
                variance.model = list(model = "sGARCH"),
                distribution.model = "norm")
m <- ugarchfit(data = return, spec = s)
plot(m)

f <- ugarchforecast(fitORspec = m,
                    n.ahead = 20)
plot(fitted(f))
plot(sigma(f))

#portfolio allocation
v <- sqrt(252) * sigma(m)
w <- 0.05/v
plot(merge(v, w),
     multi.panel = T)
tail(w)

#GARCH with sstd
s <- ugarchspec(mean.model = list(armaOrder = c(0,0)),
                variance.model = list(model = "sGARCH"),
                distribution.model = "sstd")
m <- ugarchfit(data = return, spec = s)
plot(m, which = 'all')


