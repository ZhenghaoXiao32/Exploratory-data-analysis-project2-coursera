# getting data
# download the dataset 
download_data <- function(){      
      file_name <<- "exdata-data-NEI_data.zip"
      if (!file.exists(file_name)) {
            file_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
            download.file(file_url, file_name, method = "curl")
      }
}

download_data()

## unzip the dataset
unzip_data <- function(){
      if (!file.exists("exdata-data-NEI_data")) {
            unzip(file_name)
      }
}

unzip_data()

# load data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# data preparation
agg_p2 <- aggregate(Emissions ~ year, NEI[NEI$fips == "24510", ], sum)

# create image device
png("plot2.png")

# plot using base plotting system
barplot(height = agg_p2$Emissions, names.arg = agg_p2$year,
        xlab = "Years", ylab = "Total PM2.5 Emissions",
        main = "Total PM2.5 Emissions in Baltimore from 1999 to 2008")

# shut down image device
dev.off()