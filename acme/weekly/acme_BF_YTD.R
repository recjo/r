

#Acme - read in order data for each year
df2014 = read.csv("acme_BF_2014.csv", header = TRUE, stringsAsFactors = FALSE)
df2015 = read.csv("acme_BF_2015.csv", header = TRUE, stringsAsFactors = FALSE)
df2016 = read.csv("acme_BF_2016.csv", header = TRUE, stringsAsFactors = FALSE)
df2017 = read.csv("acme_BF_2017.csv", header = TRUE, stringsAsFactors = FALSE)
df2018 = read.csv("acme_BF_2018.csv", header = TRUE, stringsAsFactors = FALSE)

df2014$OrderSourceID <- 1
df2015$OrderSourceID <- 1
df2016$OrderSourceID <- 1
df2017$OrderSourceID <- 1
df2018$OrderSourceID <- 1

#remove extra column
df2018$TotalProductDiscount <- NULL

PlotDaysOrders <- function(dfAllOrders) {
  year <- deparse(substitute(dfAllOrders))
  ordersTable <- aggregate(as.numeric(dfAllOrders$OrderSourceID), by=list(format(as.POSIXct(dfAllOrders$OrderDate, format="%Y-%m-%d %H:%M:%OS"), "%Y-%m-%d")), sum)
  names(ordersTable) <- c("DateHour","Count")
  ordersTable$DateHour = factor(ordersTable$DateHour)
  xx <- barplot(ylim = c(0,9000), las="2", names = weekdays(as.Date(ordersTable$DateHour), abbreviate=TRUE), height = ordersTable$Count, col = "aquamarine2", main = paste("ACME -", substr(year, 3, 7), "\n", sum(ordersTable$Count), "ORDERS"), xlab = "Thanksgiving to Cyber Monday", ylab = "Number of Orders")
  text(x = xx, y = ordersTable$Count, label = ordersTable$Count, pos = 3, cex = 0.8, col = "red")
}

#display bar chart showing number of orders placed for the week
PlotDaysOrders(df2014)
PlotDaysOrders(df2015)
PlotDaysOrders(df2016)
PlotDaysOrders(df2017)
PlotDaysOrders(df2018)





library(ggplot2) #for geom_point

#Compare all years activity on a line chart
dfAll <- do.call("rbind", list(df2014, df2015, df2016, df2017, df2018))
dfAll$OrderSourceID <- 1
ordersTable <- aggregate(as.numeric(dfAll$OrderSourceID), by=list(format(as.POSIXct(dfAll$OrderDate, format="%Y-%m-%d %H:%M:%OS"), "%Y-%m-%d")), sum)
names(ordersTable) <- c("DateHour","Count")
ordersTable$Year = format(as.Date(ordersTable$DateHour), "%Y")
ordersTable$DateHour = weekdays(as.Date(ordersTable$DateHour), abbreviate=TRUE)
ordersTable$DateHour = factor(ordersTable$DateHour, levels = c("Wed", "Thu", "Fri", "Sat", "Sun", "Mon", "Tue"))
ordersTable$vpos <- c(-.5, 1.5)[(ordersTable$Year == "2014")+1]
ordersTable$vpos <- c(-.5, 1.5)[(ordersTable$Year == "2015")+1]
ggplot( data = ordersTable, aes(x = DateHour, y = Count, group=Year, colour=Year)) +
  geom_line() + geom_point() +
  expand_limits(y = 0) +
  ggtitle("ACME NUMBER OF 'BLACK FRIDAY' ORDERS BY YEAR") +
  xlab("Thanksgiving to Cyber Monday") +
  ylab("Number of Orders") +
  scale_y_continuous(minor_breaks = seq(0 , 8000, 1000), breaks = seq(0, 8000, 1000)) + 
  geom_text(aes(label=ordersTable$Count), vjust=ordersTable$vpos, show_guide = FALSE)
