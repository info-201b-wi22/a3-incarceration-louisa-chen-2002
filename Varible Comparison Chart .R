
library(ggpubr)
library(ggplot2)


data1 <- read.csv("https://raw.githubusercontent.com/vera-institute/incarceration-trends/master/incarceration_trends.csv")

data3 <- summarize(group_by(data1, black_jail_pop, white_jail_pop, year, county_name, total_jail_pop)) %>% 
  filter(year == 2008)

data3 <- group_by (data3, county_name)%>% 
  summarize(black_jail_pop = sum(black_jail_pop, na.rm = TRUE), white_jail_pop = sum (white_jail_pop, na.rm = TRUE), total_jail_pop = sum (total_jail_pop, na.rm = TRUE))

black_jail_chart <- ggplot(data3) +
  geom_point(mapping = aes(x=total_jail_pop, y= black_jail_pop)) + labs( title = "Black vs Total Jail Population in Year of 2008",
                                                                         x = "Total Jail Population",
                                                                         y = "Black Jail Population")

white_jail_chart <- ggplot(data3) +
  geom_point(mapping = aes(x= total_jail_pop, y= white_jail_pop)) + labs (title = "White vs Total Jail Population in Year of 2008", 
                                                                          x = "Total Jail Population",
                                                                          y = "White Jail Population")

ggarrange(black_jail_chart, white_jail_chart + rremove("x.text"),
          ncol = 1, nrow = 2) 


