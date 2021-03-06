# Exploratory Data Analysis
## Introduction
Fine particulate matter (PM2.5) is an ambient air pollutant for which there is strong evidence that it is harmful to human health. In the United States, the Environmental Protection Agency (EPA) is tasked with setting national ambient air quality standards for fine PM and for tracking the emissions of this pollutant into the atmosphere. Approximatly every 3 years, the EPA releases its database on emissions of PM2.5. This database is known as the National Emissions Inventory (NEI). This project aims to answer some exploratory questions by giving appropriate plots. Each question is answered by a plot, the source code to generate the plot is posted.
## Questions and Answers
1. Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.
![Plot1](https://github.com/ZhenghaoXiao32/Exploratory-data-analysis-project2-coursera/blob/master/plot1.png?raw=true)

2. Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (
fips == "24510") from 1999 to 2008? Use the base plotting system to make a plot answering this question.
![Plot2](https://github.com/ZhenghaoXiao32/Exploratory-data-analysis-project2-coursera/blob/master/plot2.png?raw=true)

3. Of the four types of sources indicated by the 
type
type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.
![Plot3](https://github.com/ZhenghaoXiao32/Exploratory-data-analysis-project2-coursera/blob/master/plot3.png?raw=true)

4. Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?
![Plot4](https://github.com/ZhenghaoXiao32/Exploratory-data-analysis-project2-coursera/blob/master/plot4.png?raw=true)

5. How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?
![Plot5](https://github.com/ZhenghaoXiao32/Exploratory-data-analysis-project2-coursera/blob/master/plot5.png?raw=true)

6. Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (
fips == "06037"). Which city has seen greater changes over time in motor vehicle emissions?
![Plot6](https://github.com/ZhenghaoXiao32/Exploratory-data-analysis-project2-coursera/blob/master/plot6.png?raw=true)
