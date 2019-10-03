# ===================================================================
# Title: Stat133-Lab05
# Description:
#   This script is lab05
# Input(s): data file 'nba2018-players.csv'
# Output(s): summary data files, and plots
# Author: Zian Yan
# Date: 10-03-2019
# ===================================================================
# packages
library(dplyr)    # data wrangling
library(ggplot2)  # graphics

# Use read.csv() to import the data nba2018-players.csv in R.
# Do this by specifying a relative path.
nba <- read.csv("../data/nba2018-players.csv")
str(nba)

# Use the imported table to create a data frame warriors by selecting rows
warriors <- filter(nba, team == "GSW")
str(warriors)

# Use the function write.csv() to export (or save) the data frame 
# warriors to a data file warriors.csv in the data/ directory.
write.csv(warriors, "../data/warrior.csv", row.names = FALSE)

# Export the output of str() on the data frame with all the players.
# sink() the output, using a relative path, to a text file data-structure.txt
# in the output/ folder. 
sink(file = '../output/data-structure.txt')
str(nba)
sink()

# Export the summary() of the entire data frame warriors to a text file 
# summary-warriors.txt, in the output/ folder (also use a relative path)
sink(file = '../output/summary-warroirs.txt')
summary(warriors)
sink()

# Export another summary() of the entire data frame lakers to a text file 
# summary-lakers.txt, in the output/ folder (using a relative path)
lakers <- filter(nba, team == "LAL")
sink(file = '../output/summary-lakers.txt')
summary(lakers)
sink()

# Use jpeg() to save a histogram of age with hist() is a file called 
# histogram-age.jpeg. Give width and height of 600 and 400 pixels, 
# respectively. Save the graph in the images/ folder.
jpeg(filename = "../images/histogram-age.jpeg"
     , width = 600, height = 400)
hist(nba$age, pch = 20, xlab = 'age')
dev.off()

# Save another version of the scatterplot between height and weight in a 
# file called scatterplot2-height-weight.png, but now try to get an image 
# with higher resolution (Hint: argument pointsize is your friend). 
# Save the plot in images/.
png(filename = "../images/scatterplot2-height-weight.png"
    ,width = 800, height = 800)
plot(dat$height, dat$weight, pch = 20, 
     xlab = 'Height', ylab = 'Height')
dev.off()

# Use ggplot2 functions to make and save (with ggsave()) another 
# scatterplot of height and weight, facetting by position. Save the graph 
# in the images/ folder, and name the file height_weight_by_position.pdf.
ggplot(nba) + geom_point(aes(x=height, y=weight)) + facet_wrap(~position)
ggsave(filename = "../images/height_weight_by_position.pdf")

















