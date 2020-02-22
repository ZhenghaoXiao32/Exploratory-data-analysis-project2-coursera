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
agg_p6 <- aggregate(Emissions ~ year + fips,
                    # subset for Baltimore and Los Angeles
                    NEI[(NEI$fips == "24510" | NEI$fips == "06037") & NEI$type == "ON-ROAD", ], 
                    sum)

# change the code of cities to city names to make the plot more clear
agg_p6$fips[agg_p6$fip == "24510"] <- "Baltimore"
agg_p6$fips[agg_p6$fip == "06037"] <- "Los Angeles"

# plot using ggplot2 system
plot6 <- ggplot(agg_p6, aes(x = factor(year), y = Emissions)) +
         facet_grid(.~ fips) + 
         geom_bar(stat = "identity", fill = "gray") +
         labs(x = "Years", y = "Total PM2.5 Emissions", 
              title = "Total PM2.5 Emissions On-Road from 1999 to 2008 in Two Cities") +
         theme_classic()

# save plot
ggsave("plot6.png", plot6)
