# Spring 2018


# Project 2: Image Classification - Predictive Modelling

----

![image](figs/dog_cat.png)

### [Project Description](doc/)

Term: Spring 2018

+ Project title: Cats :cat2: or Dogs :dog2: ?
+ Team Number: 5
+ Team Members:
  + Ginny Gao
  + Sile Yang
  + Juho Ma
  + Chris Lai
  + Noah Chasek-Macfoy
                
+ Project summary: In this project, we extracted features of cats and dogs, explored and compared various classification models to detect whether an image shows a cat or dog.

 + Baseline model: GBM with SIFT features
   
 + Proposed model: XGBoost with SIFT + HoG features, Convolutional Neural Network 

+ Project details: We explored different feature extraction methods, including as SIFT, HoG, SIFT + HoG, RGB + PCA, and SIFT + HoG + RGB + PCA. We also tested different classification models to select a model that achieves best performance, from algorithm accuracy, runtime, and memory perspective. Please refer to our [`main.Rmd`](https://github.com/GU4243-ADS/project-2-predictive-modelling-group-5/blob/master/doc/main.Rmd) for more details. For the efficiency of computation and the improved accuracy, we chose XGBoost classier with SIFT + HoG features, which increased the accuracy over the baseline from 64% to 79% and decreased the training runtime from a the baseline of 1096.47s down to 183.979s.

  + Performance comparsion between baseline and advanced model  
  ![image](figs/Performance_comparison_1.png)
  
  + Performance comparison across different features and models explored  
  ![image](figs/Performance_comparison_2.png)

+ CNN architecture. 
Convolution is a mathematical operation that’s used in single processing to filter signals, find patterns in signals.    
In cnn, we used `tf.nn.conv2d` to create 3 convolutional layers (one is gray). For prediction and optimization, we use `session.run()` to calculate accuracy. Function `print_accuracy` is a function for printing the classification accuracy on the test set.    
More details can be found [here](https://github.com/GU4243-ADS/project-2-predictive-modelling-group-5/blob/master/lib/cnn.ipynb).
![image](figs/cnn-image-1.jpg)

Contribution statement: [default](doc/a_note_on_contributions.md) All team members contributed equally in all stages of this project. All team members approve our work presented in this GitHub repository including this contributions statement.

#### Ginny Gao
1. Feature    
a. Compiled SIFT features from separate .RData files to an organized feature matrix that is used by different models, selected key features points using Bag of Visual Words methodology.  
b. Prepared HoG, and SIFT + HoG feature to read training and testing images.

2. Model  
a. Tested SIFT with GBM model with parameter tuning.  
b. Tested GBM on HoG, and SIFT + HoG.

3. Misc  
a. Contributed to `main.Rmd` and `README.md`.  
b. Facilitated meetings, discussions, result output.

#### Sile Yang
Convolutional Neral Networks  
a. Extracted arrays from raw iamges and organized them into one dataset that is suitable for convolutional Neural Networks model.    
b. Built neural networks model with three layers by Tensorflow.  
c. Tested the neuron network classifier.

#### Juho Ma
a. Constructed HoG features  
b. Built randomForest classifier  
c. Tested models; SIFT + GBM, SIFT + RF, HoG + RF, SIFT + HoG + RF
d. Debugged SIFT and HoG; ran the final model  
e. Contributed to `README.md`

#### Chris Lai
a. Constructed RGB + PCA features  
b. Built XGBoost classifier  
c. Tested XGBoost models  
d. Contributed to `main.Rmd`

#### Noah Chasek-Macfoy
a. Constructed SVM model, cross validated cost parameter on SIFT and HoG features  
b. Built ORB feature extraction method between python and R  
c. Worked on de-bugging ORB features  
d. built alternative summarization method for SIFT features selecting random keypoints   

#### All
a. Client problem analysis  
b. Github collaboration and organization  
c. Contribution to presentation content

Following [suggestions](http://nicercode.github.io/blog/2013-04-05-projects/) by [RICH FITZJOHN](http://nicercode.github.io/about/#Team) (@richfitz). This folder is orgarnized as follows.

```
proj/
├── lib/
├── data/
├── doc/
├── figs/
└── output/
```

Please see each subfolder for a README file.
