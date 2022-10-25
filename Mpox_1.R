#Install Required Libraries
install.packages("RSocrata")
library(RSocrata)
install.packages("tidyverse")
library(tidyverse)

#Read MonkeyPox Data into a tibble
monkey_pox_dt <- 
  RSocrata::read.socrata(
    url = "https://data.ct.gov/resource/qhtt-czu2.json"
  ) %>% 
  as_tibble()

#Look at the Data to verify it looks okay
print(monkey_pox_dt)

#Basic plot on count of cases for each report period start
ggplot(data = monkey_pox_dt) + 
  geom_bar(mapping = aes(x = reportperiodstart))

#Modifying the existing plot to display label and change the colors
ggplot(data = monkey_pox_dt) + 
  geom_bar(mapping = aes(x = reportperiodstart,fill = ..count..)) +
  geom_text(aes(x = reportperiodstart, label = ..count..), stat = "count", vjust = 1.5, colour = "white")



