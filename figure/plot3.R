household.data <- read.table("household_power_consumption.txt", header = TRUE,sep = ";", na.strings = "?")
library(dplyr)
household.data <- mutate(household.data, Date = as.Date(Date,format = "%d/%m/%Y"), Time = strptime(paste(Date,Time),format = "%Y-%m-%d %H:%M:%S"))
todays <- subset(household.data, Date >= "2007-02-01" & Date <= "2007-02-02")
png(filename = "plot3.png")
with(todays, plot(Time ,Sub_metering_1, xlab = "",ylab = "energy sub metering", type = "l"))
with(todays, points(Time ,Sub_metering_2, col = "red", type = "l"))
with(todays, points(Time ,Sub_metering_3, col = "blue", type = "l"))
legend("topright", lty = 1, col = c("black", "red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
dev.off()