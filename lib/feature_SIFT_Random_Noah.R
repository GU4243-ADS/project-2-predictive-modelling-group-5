############### Description: turns SIFT keypoints and descriptors from many images into a single matrix where nrows=number of images, ncols = length of 10 random sequentially concatentated 128-dim keypoint descriptors (for each image.)

## 

############### Inputs:
# "img_dir" = must NOT end with a "/"


# "set_name" = default = ""

# "data_name" =       default ="pets"

# "export" =     default = TRUE

# "nfeatures" = number of random keypoint descriptors to use image. 
# default = 10

############## Outputs:
# "dat" = an .RData file of SIFT features for all images in input directory. 
# nrow = number of images in input directory. ncol = 128*nfeatures

# "feature_SIFT_random_data_name_set_name.RData" = file containing the "dat" 
# data object



###################################

#img_dir <-  "/Users/admin/Desktop/Columbia/Spring 2018/Applied DS/Pet Images and Extracted Features - Project 2/Practice SIFT Set 500/"

feature_SIFT_random_Noah <- function(img_dir, set_name = "", data_name = "pets", export=T, nfeatures = 10) {
  
  n_files <- length(list.files(img_dir))  
  #dat <- matrix(NA, nrow = length(n_files), ncol = 128*nfeatures)
  dat <- list()
  
  set.seed(123)
  for (i in 1:n_files) {
    # loads two data objects, one of which, features, has nrows = number of 
    # image keypoints
    load(paste(img_dir,'/', 'pet', i, '.jpg.sift.Rdata', sep = ''))
    
    #create matrix
    subset <- matrix(NA, nrow = nfeatures, ncol = 128)
    
    for(n in 1:nfeatures) {
      # choose nfeatures=10 random rows (=keypoint descriptors) from the
      #features matrix and assign them to list "subset" 
      if (nrow(features) >= nfeatures) {
        
        subset[n,] <- features[sample(nrow(features), nfeatures)[[n]],]
      } else {
        subset[n,] <- features[sample(nrow(features), nfeatures, replace = TRUE)[[n]],]
      }
    }
    #turn my list of vectors into a matrix with each vector as a row
    #subset <- t(simplify2array(subset))
   
    # turn matrix "subset" into a single vector made up of the sequentially 
    # concatonated rows of "subset". assign the new vector to the 
    #ith element of "dat" list
    subset <- as.vector(t(subset))
    dat[[i]] <- subset
  }
  # combined the "dat" list elements into rows of a single matrix. 
  #dat <- do.call(rbind, dat)
  dat <- t(simplify2array(dat))
  
  ### output constructed features
  if(export){
    save(dat, file = paste0("../output/feature_SIFT_random", data_name, "_", set_name, ".RData"))
  } 
  #output "dat" as matrix
  #return(dat)
}




#####################################################
####Improvements?





###########################
#test <- matrix(c(rep(1,3),rep(2,3),rep(3,3), rep(4,3), rep(5,3)), ncol=3, byrow = TRUE)
#test
#[,1] [,2] [,3]
#[1,]    1    1    1
#[2,]    2    2    2
#[3,]    3    3    3
#[4,]    4    4    4
#[5,]    5    5    5

#test[sample(nrow(test), 2)[[2]],]
#test2 <- matrix(NA, nrow = 5, ncol = 3)
#test2[3,] <- test[sample(nrow(test), 2)[[2]],]

#test <- feature_SIFT_random("/Users/admin/Desktop/Columbia/Spring 2018/Applied DS/Pet Images and Extracted Features - Project 2/Practice SIFT Set 500/")
