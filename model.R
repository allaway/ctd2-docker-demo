set.seed(1)
library(dplyr)
library(readr)

template <- readr::read_csv('/template.csv') 

##model code...we are going to predict everything randomly between 0 and 1 for this example

predictions <- template %>% #get template
  mutate_at(vars(-target), ~ runif(n = nrow(template))) #insert random value in every column except for Patient_ID (do not modify that column)

## output your predictions to "/predictions.csv" in your container
predictions %>% write_csv('/predictions.csv')

