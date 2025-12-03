library(vroom)
library(tidyverse)
library(tidymodels)
library(vroom)
library(tidytext)
library(jsonlite)

train <- vroom("~/GitHub/Stat 348/WhatsCooking/data/train.json/train.json")
test <- vroom("~/GitHub/Stat 348/WhatsCooking/data/test.json/test.json")

trainSet <- read_file("~/GitHub/Stat 348/WhatsCooking/data/train.json/train.json") %>%
fromJSON()
testSet <- read_file("~/GitHub/Stat 348/WhatsCooking/data/test.json/test.json") %>%
fromJSON()

dim(trainSet)

stopwords <- c("the", "salt")
trainSet_tidy <- trainSet %>%
  unnest(ingredients) %>%
  filter(!ingredient %in% stopwords)



train_features <- trainSet_tidy %>%
  group_by(id, cuisine) %>%
  summarise(numb_ingre = n(), .groups = "drop")

