# File Name: EDA.R

# Description: Exploratory analysis for the project conducted on the side

#############################

# Libraries
library(tidyverse)
library(readr)
library(reactable)

  
my_ggtheme <- function() {

  theme_minimal(base_family = "Asap Condensed") +
    theme(
      panel.grid.minor = element_blank(),
      plot.title = element_text(vjust = -1)
          )
}

###########
# The building in question:
# stories = 15
# building type = mixed use
# baseline construction = 100 million
# 5% expected premium for green certification
# Cooling demand <- Building is going to be in Austin so it will have a high number of cooling degree days
# Fewer heating degree days 
# Building size = 250,000


green <- read_csv("MSBA/Summer/sta-380/Data/greenbuildings.csv")


green %>% ggplot(aes(x = stories)) + 
  geom_bar(fill = "dark orange") + 
  my_ggtheme()

green %>% ggplot(aes(x = size)) + 
  geom_histogram(fill = "dark orange") + 
  my_ggtheme()
  

# First the analysis seems off in terms of grouping all the buildings with different stories together
green %>% ggplot(aes(x=total_dd_07)) + 
  geom_histogram(fill = "dark orange") + 
  my_ggtheme()


# Let's try looking at buildings that match our descriptive building more
building_df <- green %>% 
  filter(
    stories >= 10 & stories <= 20,
    size >= 200000 & size <= 300000,
    age < 10
  )

building_df %>% 
  ggplot(aes(x = green_rating)) +
  geom_bar(fill = "dark orange") + 
  my_ggtheme()

building_df %>% mutate(
  class = ifelse(class_a == 1, "A", ifelse(class_b == 1, "B", "C"))
) %>% 
  ggplot(aes(x = cluster)) + 
  geom_bar(fill = "dark orange") + 
  my_ggtheme()

building_df %>% 
  ggplot(aes(x=net)) + 
  geom_bar(fill = "dark orange") + 
  my_ggtheme()

building_df %>% group_by(cluster, green_rating) %>% 
  summarise(
    cluster_rent_eco = mean(Rent, na.rm = TRUE)
  )

comparison <- green %>% group_by(cluster, green_rating) %>% 
  summarise(
    cluster_rent_eco = mean(Rent, na.rm = TRUE)
  ) %>% pivot_wider(names_from = green_rating, values_from = cluster_rent_eco) %>% 
  mutate(
    diff = `1` - `0`
  )

green <- green %>% 
  mutate(
    class = ifelse(class_a == 1, "A", ifelse(class_b == 1, "B", "C"))
  )

green %>% group_by(class, green_rating) %>% 
  summarise(
    rent = mean(Rent, na.rm = TRUE)
  )


green %>% ggplot(aes(x = Rent)) + 
  geom_histogram(fill = "dark orange") + 
  my_ggtheme()
  
  
reactable(comparison) 

mean(comparison$diff, na.rm = TRUE)

green %>% group_by(green_rating) %>% summarise(
  rent = mean(Rent, na.rm = TRUE)
)

green %>% ggplot(aes(x = Rent, y = leasing_rate)) + 
  geom_point(color = "dark orange", alpha = 0.7) + 
  my_ggtheme()

#####


atx %>% mutate(
  Duration = DepDelay + AirTime,
  Duration_Diff = ActualElapsedTime - Duration
) %>% ggplot(aes(x = ActualElapsedTime, y = Duration_Diff)) + 
  geom_point()
