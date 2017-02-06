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

dplyr::select(bat, Site, Habitat, Season, Chgouldii)

select(bat, starts_with("dist"))

#New column name on left hand side, combinations used to compute new variable on right
#Can subtract variables too, just add - sign in front of them
#To replace variable include exisiting variable name on both sides of columm and what you want to do to it on the right
dplyr::mutate(bat, Taust_Vdarl = Taustralis + Vdarlingtoni)

#Summarise mean of gould's wattled bat- ouput mean with other data dropped
summarise(bat, mean_Chgouldii = mean(Chgouldii))

bat %>%
  select(1:4) %>%
  group_by(Season) %>%
  summarise(mean_Cg = mean(Chgouldii))

se <- function(x) {
  sqrt(var(x, na.rm = TRUE) / length(na.omit(x)))
}

# Apply the function to the Chgouldii column
bat %>%
  select(1:4, Bioregion) %>%
  group_by(Bioregion, Season) %>%
  summarise(mean_Cg = mean(Chgouldii),
            se_Cg = se(Chgouldii))

#Convert the catergorical variables Moon, NatEx and Bioregion to factors
dplyr::mutate(bat, Moon = as.factor(Moon))
dplyr::mutate(bat, NatEx = as.factor(NatEx))
dplyr::mutate(bat, Bioregion = as.factor(Bioregion))



