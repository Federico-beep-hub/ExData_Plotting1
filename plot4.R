# Cargar datos
data <- read.table("C:/Users/fcomsil/Downloads/exdata_data_household_power_consumption/household_power_consumption.txt",
                   header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)

# Convertir fecha y hora
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data_filtered <- subset(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

# Crear columna datetime combinada
data_filtered$Datetime <- as.POSIXct(paste(data_filtered$Date, data_filtered$Time))

# Crear gráfico
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))  # 2 filas, 2 columnas

# 1
plot(data_filtered$Datetime, data_filtered$Global_active_power, type="l",
     xlab="", ylab="Global Active Power")

# 2
plot(data_filtered$Datetime, data_filtered$Voltage, type="l",
     xlab="datetime", ylab="Voltage")

# 3
plot(data_filtered$Datetime, data_filtered$Sub_metering_1, type="l",
     xlab="", ylab="Energy sub metering")
lines(data_filtered$Datetime, data_filtered$Sub_metering_2, col="red")
lines(data_filtered$Datetime, data_filtered$Sub_metering_3, col="blue")
legend("topright", bty="n", 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lty=1)

# 4
plot(data_filtered$Datetime, data_filtered$Global_reactive_power, type="l",
     xlab="datetime", ylab="Global_reactive_power")

dev.off()