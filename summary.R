
# Calculate the highest total jail population among these years

data_pop_highest <- summarize (group_by(data1, year, total_jail_pop, state))

data_pop_highest <- group_by(data_pop_highest, year) %>% 
  summarize(total_jail_pop = sum(total_jail_pop, na.rm = TRUE))

data_pop_highest <- data_pop_highest %>% 
  filter (total_jail_pop == max(total_jail_pop)) %>% 
  pull(total_jail_pop)

# Which year has the highest total jail population?

data_year_highest <- summarize (group_by(data1, year, total_jail_pop, state))

data_year_highest <- group_by(data_year_highest, year) %>% 
  summarize(total_jail_pop = sum(total_jail_pop, na.rm = TRUE))

data_year_highest <- data_year_highest %>% 
  filter (total_jail_pop == max(total_jail_pop)) %>% 
  pull(year)

# Which state has the highest total jail population in 2008 

data_state_highest <- summarize (group_by(data1, year, total_jail_pop, state))

data_state_highest <- group_by(data_state_highest, year, state)%>% 
  filter (year == 2008) %>% 
  summarize(total_jail_pop = sum(total_jail_pop, na.rm = TRUE)) %>% 
  filter (total_jail_pop == max (total_jail_pop)) %>% 
  pull (state)


# How many population in jail in the state with highest total jail population? 

data_state_pop_highest <- summarize (group_by(data1, year, total_jail_pop, state))

data_state_pop_highest <- group_by(data_state_pop_highest, year, state)%>% 
  filter (year == 2008) %>% 
  summarize(total_jail_pop = sum(total_jail_pop, na.rm = TRUE)) %>% 
  filter (total_jail_pop == max (total_jail_pop)) %>% 
  pull (total_jail_pop)



# What is the recent year and first year in the dataset? 

data_year_recent <- summarize(group_by(data1, year)) %>% 
  filter (year == max (year, na.rm = TRUE)) %>% 
  pull (year)


data_year_earlist <- summarize(group_by(data1, year)) %>% 
  filter (year == min (year, na.rm = TRUE)) %>% 
  pull (year)


