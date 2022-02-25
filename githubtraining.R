library(dplyr)
library(ggplot2)
library(palmerpenguins)
library(janitor)

#load data:
data("penguins")

penguins_raw2 <- clean_names(penguins_raw) #cleaning up column names (puts a _ instead of a space in column names)

#summarie data per species and island
#.drop=false means it will still show datasets that are missing or value is 0

penguins_raw2 %>% 
    mutate(across(c(species, island), factor)) %>%
  group_by(species, island, .drop=FALSE) %>%  
  count()

penguins_raw2 %>%
  group_by(species, sex) %>%
  count()

penguins_raw2 %>%
  group_by(species) %>%
  summarize(mean.mass = mean(body_mass_g, na.rm = TRUE),
           sd.mass = sd(body_mass_g, na.rm =TRUE))
