# import pandas as pd
# df=pd.read_csv('data.csv',index_col='Date',parse_dates=True)
# df=df.dropna()
# print('Shape of data',df.shape)
# df.head()
# df
# from pmdarima import auto_arima
# stepwise_fit = auto_arima(df['Temp'], trace=True,
# suppress_warnings=True)
# print(df.shape)
# train=df.iloc[:-30]
# test=df.iloc[-30:]
# print(train['Temp'])
# print(train.shape,test.shape)
# from statsmodels.tsa.arima.model import ARIMA
# model=ARIMA(train['Temp'],order=(1,0,5))
# model=model.fit()
# model.summary()

import matplotlib.pyplot as plt
import pandas as pd
from statsmodels.tsa.arima.model import ARIMA


# Read the CSV file
csv_file = 'data.csv'  # Path to your CSV file
data = pd.read_csv(csv_file, parse_dates=['Date'], index_col='Date')


# Fit the ARIMA model
p, d, q = 0, 1, 0  # Example parameters, you might need to tune these
model = ARIMA(data['Temp'], order=(p, d, q))
model_fit = model.fit()

# Forecast the next 15 seconds
forecast_steps = 225
forecast = model_fit.forecast(steps=forecast_steps)

# Create a new time index for the forecast
forecast_index = pd.date_range(
    start=data.index[-1], periods=forecast_steps + 1, freq='S')[1:]

# Plot the results
plt.figure(figsize=(10, 5))
plt.plot(data.index, data['Temp'], label='Observed')
plt.plot(forecast_index, forecast, label='Forecast', color='red')
plt.xlabel('Time')
plt.ylabel('Temperature')
plt.title('Temperature Forecast for the Next 15 Seconds')
plt.legend()
plt.savefig('D:\\phong.png')
plt.show(block=False)

# Print the forecasted values
predicted_data = forecast.to_list()
print("Predicted data: ", predicted_data[0], "-------")
