library(dplyr)
library(glue)
library(readr)

template <- read_csv('/template.csv') 

##model code...we are going to predict everything randomly between 0 and 1 for this example

predictions <- template %>% #get template
  mutate_at(vars(-target), ~ runif(n = nrow(template))) #insert 2 in every column except for Patient_ID (do not modify that column)

## you must output your predictions to "/output/predictions.csv" in your container
predictions %>% write_csv('/output/predictions.csv')

