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

# concatenate datasets
NEI_SCC <- merge(NEI, SCC, by = "SCC")

library(ggplot2)
# data preparation
# use grepl to get all the coal-source data
subset_NEI_SCC <- NEI_SCC[grepl("coal", NEI_SCC$Short.Name, ignore.case = TRUE), ]
# aggregate by years
agg_p4 <- aggregate(Emissions ~ year, subset_NEI_SCC, sum)

# plot with ggplot2 system
plot4 <- ggplot(agg_p4, aes(x = factor(year), y = Emissions)) +
         geom_bar(stat = "identity", fill = "gray") + 
         labs(x = "Years", y = "Total PM2.5 Emissions",
              title = "Total PM2.5 Emissions from Coal Sources from 1999 to 2008") + 
         theme_classic()

# save plot
ggsave("plot4.png", plot4)
