# Tidyverse libraries to tidy bat data

library("tidyverse")

readr::read_csv("./data/bat_dat.csv")

iris <- read_csv("./data/iris_data.csv", comment = "#", 
         col_types = cols(
           Sepal.Length = col_double(),
           Sepal.Width = col_double(),
           Petal.Length = col_double(),
           Petal.Width = col_double(),
           Species = col_factor(c("setosa", "versicolor", "virginica"))
         ))
dplyr::glimpse(iris)

View(iris)

bat <- readr::read_csv("./data/bat_dat.csv")

View(bat)

dplyr::filter(bat, Season == 1)

dplyr::filter(bat, Season == 1, Chgouldii > 100)
