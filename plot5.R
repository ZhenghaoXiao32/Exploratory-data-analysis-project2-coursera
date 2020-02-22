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

library(ggplot2)
# data preparation
agg_p5 <- aggregate(Emissions ~ year + type, 
                            NEI[NEI$fips == "24510" & NEI$type == "ON-ROAD", ], sum)

# plot using ggplot2 system
plot5 <- ggplot(agg_p5, aes(x = factor(year), y = Emissions)) +
         geom_bar(stat = "identity", fill = "gray") +
         labs(x = "Years", y = "Total PM2.5 Emissions", 
              title = "Total PM2.5 Emissions On-Road in Baltimore from 1999 to 2008") +
         theme_classic()

# save plot
ggsave("plot5.png", plot5)
