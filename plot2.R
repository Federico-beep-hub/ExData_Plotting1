data <- read.table("C:/Users/fcomsil/Downloads/exdata_data_household_power_consumption/household_power_consumption.txt",
                   header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)

# Convertir fecha y hora
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data_filtered <- subset(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

# Crear columna datetime combinada
data_filtered$Datetime <- as.POSIXct(paste(data_filtered$Date, data_filtered$Time))

# Crear gráfico
png("plot2.png", width=480, height=480)
plot(data_filtered$Datetime, data_filtered$Global_active_power, type="l",
     xlab="", ylab="Global Active Power (kilowatts)")
dev.off()