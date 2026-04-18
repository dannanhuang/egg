library(fpp2)
library(urca)
library(tseries)
library(forecast)
library(lmtest)
library(Metrics)
library(quantmod)

# ======download Bitcoin data (5 years) from yahoo finance======
data = getSymbols("BTC-USD",src= "yahoo",from="2020-01-01", to ="2025-12-31",interval="ld",auto.assign=F)
head(data)


# ======Identify the patterns in the data======
close = Cl(data) # take the close price
close

autoplot(close)

dev.new()
autoplot(close[1:730])
# The close price shows an increasing trend


# ====== test the stationarity and determine its order of integration ======

summary(ur.kpss(close))
# The SPSS test statistic is 15.5887>critical level (5%) = 0.463, reject H0 : the close price is non stationary

# Perform first-order differencing
dclose = diff(log(close))
summary(ur.kpss(dclose))
# the differenciated close price is stationary because KPSS test statistic = 0.1634< critival value (5%)

# the order of integration of the close price is 1


# ====== split the data into training period (75%) and test period ======
n = length(close)
h = n-floor(0.75*n)

train_end=time(close)[n-h]
test_start=time(close)[n-h+1]

training=window(close, end=train_end)
test = window(close, start=test_start)


# ======fit the best ARIMA model to the data======
fit = auto.arima(training)
summary(fit)
# the best ARIMA model is ARIMA(0,1,1)

# plot the acf & pacf to justify
dclose <- na.omit(dclose)
acf(dclose, main = "ACF of BTC-USD")
# The ACF plot shows a cutoff at lag 1, therefore q = 1.
pacf(dclose, main = "PACF of BTC-USD")
# The PACF plot shows no clear cutoff, therefore p = 0


# ====== test the significance of estimated parameters ======
coeftest(fit)
# prob(mal) = 0.01428< 0.05:reject H0:mal is significant at the 5% level
 

# ====== predict the Bitcoin USD Price ======
pred = forecast(fit,h=h)
autoplot(pred)


# ======compute the MAE and RMSE ======
rmse_arima = rmse(as.numeric(test),as.numeric(pred$mean))
rmse_arima

mae_arima=mae(as.numeric(test),as.numeric(pred$mean))  
mae_arima


# ======compare the ARIMA  forecasting performance with the additive & multiplicative Holt-Winters methods. Using weekly seasonality for the HW methods======
pred_add = hw(ts(training,frequency=7),h=h,seasonal="additive")
rmse_add = rmse(as.numeric(test),as.numeric(pred_add$mean))
rmse_add
mae_add=mae(as.numeric(test),as.numeric(pred_add$mean))  
mae_add
autoplot(pred_add)

pred_mult = hw(ts(training,frequency=7),h=h,seasonal="multiplicative")
rmse_mult = rmse(as.numeric(test),as.numeric(pred_mult$mean))
rmse_mult
mae_mult=mae(as.numeric(test),as.numeric(pred_mult$mean))  
mae_mult
autoplot(pred_mult)

comp = data.frame(Method = c("ARIMA","ADD_HW","MULT_HW"),RMSE=c(rmse_arima,rmse_add,rmse_mult),mae=c(mae_arima,mae_add,mae_mult))
comp
comp[c(which.min(comp$RMSE),which.min(comp$MAE)),1]


# ====== give the value of the optimal parameters of the HW methods ======
pred_mult$model
