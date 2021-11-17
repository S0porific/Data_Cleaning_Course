# Author: Rahul Deo

# Loading of Data
library('dplyr')
library('caret')

train_data <- read.csv('pml-training.csv')
test <- read.csv('pml-testing.csv')
ignore_col <- c("X", "raw_timestamp_part_1", "raw_timestamp_part_2", "num_window" )

# Remove the columns with missing data 
filter_train <- train_data[, colSums(is.na(train_data)) == 0]
filter_train <- filter_train[,(as.vector(colSums(filter_train== "", na.rm = TRUE) == 0))] # Remove columns with blank spaces

train_x <- dplyr::select_if(filter_train, is.numeric)
train_y <- filter_train$classe
selected_col = names(train_x)[!(names(train_x)==ignore_col)]
train_x <- train_x[, selected_col]
# Remove the columns with missing data 
test_x <- test[, selected_col]

# Train Random forest for the prediction 
ctrl <- trainControl(method = "repeatedcv", repeats = 5, number = 5)
set.seed(825)
gbm <- train(x= train_x, y =train_y, method = 'gbm', trControl=ctrl)
predict(gbm,test_x)