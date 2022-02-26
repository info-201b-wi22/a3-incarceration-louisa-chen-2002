library("mapproj")
library("maps")
library(ggplot2)
library("dplyr")
library("mapdata")
library(ggplot2)
library(ggmap)

data1 <- read.csv("https://raw.githubusercontent.com/vera-institute/incarceration-trends/master/incarceration_trends.csv")

# Make a new dataframe of the total recreation visits for each state
state_data1 <- data1 %>% 
  group_by (state) %>%
  filter(year == 2002) %>% 
  summarize(data_2002 = sum(female_jail_pop, na.rm = TRUE))
View (state_data1)

# Load state shapefile
state_shape <- map_data ('state')

# Load built-in state names and abbreviations
state_abbrevs <- data.frame (state.abb, state.name)

# Join `np_state_data` and `state_abbrevs`
# Hint: by=c('left_column' = 'right_column')
state_data1 <-  left_join (state_data1, state_abbrevs, by=c('state' = 'state.abb'))

# Add a new column to the `np_state_data` dataframe called "region" that includes a lowercase version of the state name
# Hint: don't forget tolower()!
state_data1 <- state_data1 %>% mutate(region = tolower(state.name))

# Join the `state_shape` and `np_state_data` dataframes
state_shape <- left_join(state_shape, state_data1)

# Now make a map of National Park recreation visits by state!
# Add a plot title and legend title
ggplot(state_shape) +
  geom_polygon(mapping = aes(x = long, y = lat, group = group, fill = data_2002)) + scale_fill_continuous(low = 'white', high ='red', labels = scales::label_number_si()) +
  coord_map() +
  labs(title = 'Map of 2002 jail population distribution', fill = 'data_2002')


