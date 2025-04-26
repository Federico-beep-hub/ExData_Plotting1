# Cargar datos
data <- read.table("C:/Users/fcomsil/Downloads/exdata_data_household_power_consumption/household_power_consumption.txt",
                   header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)

# Convertir fecha
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# Filtrar datos del 1 y 2 de febrero de 2007
data_filtered <- subset(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
png("plot1.png", width=480, height=480)
hist(data_filtered$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
