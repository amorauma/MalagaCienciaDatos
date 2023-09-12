##
See

https://libguides.princeton.edu/R-Timeseries

https://papers.ssrn.com/sol3/papers.cfm?abstract_id=4316960


A Primer on Time Series Analysis with R
Prof. Dr. Joerg Osterrieder1
Associate Professor of Finance and Artificial Intelligence
University of Twente, Department of High-Tech Business and Entrepreneurship, Netherlands
Professor of Sustainable Finance
Bern Business School, Institute of Applied Data Science and Finance, Switzerland
Action Chair EU COST Action CA19130, Fintech and Artificial Intelligence in Finance, Europe


# Weekly data of COVID-19 cases from
# 22 January, 2020 to 15 April, 2020
x <- c(580, 7813, 28266, 59287, 75700,
       87820, 95314, 126214, 218843,
       471497, 936851, 1508725, 2072113)

# library required for decimal_date() function
library(lubridate)

# library required for forecasting
library(forecast)

# output to be created as png file
png(file ="forecastTimeSeries.png")

# creating time series object
# from date 22 January, 2020
mts <- ts(x, start = decimal_date(ymd("2020-01-22")),
          frequency = 365.25 / 7)

# forecasting model using arima model
fit <- auto.arima(mts)

# Next 5 forecasted values
forecast(fit, 5)

# plotting the graph with next
# 5 weekly forecasted values
plot(forecast(fit, 5), xlab ="Weekly Data",
     ylab ="Total Positive Cases",
     main ="COVID-19 Pandemic", col.main ="darkgreen")

# saving the file
dev.off()