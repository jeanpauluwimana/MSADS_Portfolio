# Function that shuffle data by row indexes then chops dataset into 
# 2 different sets for training and testing purposes
# This function takes 2 input parameters which represent the dataset
# being split into train and test data sets and the second parameter
# represents a string of the cutoff definition whether 'train' or 'test'
######################################################################

shuffle_cut <- function(dataset, subset)
{
  # Getting row size
  size <- nrow(dataset)
  # extract data row indexes
  rowIndex <- sample(size) # shuffling data indexes 
  # cutting dataset at 70% for the train data
  if(subset == "train")
  {
    sixty_percent <- floor(length(rowIndex) * 70 / 100)
    trainData <- dataset[rowIndex[1:sixty_percent], ]
    return(trainData)
  }
  else
  {
    # Use the remaining 30% for test data set
    forty_percent <- ceiling(length(rowIndex) * 30 / 100)
    testData <- dataset[rowIndex[1:forty_percent], ]
    return(testData)
  }
}