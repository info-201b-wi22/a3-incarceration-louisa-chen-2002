data1 <- read.csv("https://raw.githubusercontent.com/vera-institute/incarceration-trends/master/incarceration_trends.csv")


library(ggmap)
library(maps)
library(mapproj)
library(dplyr)
library(ggplot2)

data2 <- summarize (group_by (data1, state, year, total_jail_pop)) %>% 
  filter(state == "UT" | state =="WA" | state =="CA" | state == "NY" | state == "DC")

data2 <- group_by(data2, year, state) %>% 
  summarize(total_jail_pop =sum(total_jail_pop, na.rm = TRUE))



ggplot(data2) +
  geom_line(mapping = aes(x = year, y = total_jail_pop, color = state)) + 
  labs(title = "Trends of five states in total jail population from 1970 to 2018")







