############### Inputs:
# "dat_train" = data.frame matrix (MUST be matrix) of predictors. rows are images; ncol = the 
# dimensions of the image features

# "label_train" = data frame of labels ******* expect 1,0 data frame matrix??

# NB: nrows of "dat_train" and "label_train" must be the same!

# "par" = hyper-parameter "cost" to estimate model with. Default = 10


############### Outputs:

#  "svmfit" - fitted (i.e estimated parameters) support vector classifier 
# model object from svm() [the fitted model can be used with a predict function to get
# test predictions] 



#######################################

train_SVM <- function(dat_train, label_train, par = 10) {
  
  library(e1071)
  
  ##########If it doesn't come in the right form already
  #label_train <- "/Users/admin/Desktop/Columbia/Spring 2018/Applied DS/Pet Images and Extracted Features - Project 2/train_label.txt"
  #label <- read.table(label_train, header = F)
  #label <- as.numeric(unlist(label) == "dog")
  #label_train <- as.matrix(label)
  #colnames(label_train) <- "labels"
  ##########
  
  svmfit <- svm(x = dat_train, y = as.factor(label_train) , kernel="linear", cost = par, scale=FALSE)
  
  return(list(fit = svmfit))
}

###########################################

# Do we really need to translate dog, cat into 1,0. Does it actually effect output. R will choose to set first factor level to 1 I beleive.