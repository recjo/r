dfAllOrders = read.csv("acme_BF_2017.csv", header = TRUE, stringsAsFactors = FALSE)
dfAllOrders$OrderSourceID <- 1

PlotDaysOrders <- function(day) {
  daysOrders <- subset(dfAllOrders, as.Date(OrderDate) == as.Date(day))
  ordersTable <- aggregate(as.numeric(daysOrders$OrderSourceID), by=list(format(as.POSIXct(daysOrders$OrderDate, format="%Y-%m-%d %H:%M:%OS"), "%H")), sum)
  names(ordersTable) <- c("DateHour","Count")
  ordersTable$DateHour = factor(ordersTable$DateHour)
  xx <- barplot( ylim = c(0,650), names = ordersTable$DateHour, height = ordersTable$Count, col = "skyblue", main = paste(sum(ordersTable$Count), "ACME ORDERS by HOUR on\n", weekdays(as.Date(day)), format(as.Date(day), "%m/%d/%y"), sep=" "), xlab = "24 Hours", ylab = "Number of Orders")
  text(x = xx, y = ordersTable$Count, label = ordersTable$Count, pos = 3, cex = 0.8, col = "red")
}

PlotDaysOrders("2017-11-22") #Wednesday
PlotDaysOrders("2017-11-23") #Thanksgiving
PlotDaysOrders("2017-11-24") #Black Friday
PlotDaysOrders("2017-11-25") #Saturday
PlotDaysOrders("2017-11-26") #Sunday
PlotDaysOrders("2017-11-27") #Cyber Monday
PlotDaysOrders("2017-11-28") #Tuesday




