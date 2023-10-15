setwd("C:/Users/victo/PROYECTO/BASE DE DATOS")
install.packages("openxlsx")
library(openxlsx)
prueba <- "C:/Users/victo/PROYECTO/BASE DE DATOS/prueba3.xlsx"
base <- read.xlsx(prueba)
base <- base[-(21:25),] # 21 to 25 records were considered outliers
base
install.packages("caret")
library(caret)

particion=createDataPartition(y=base$COT,p=0.75,list=FALSE)
entreno=base[particion,]
testeo=base[-particion,]


library(nnet)
set.seed(8);red=nnet(COT~.,entreno,size=58,maxit=1000100,
linout=TRUE, decay= 0.015)
install.packages("NeuralNetTools")
library(NeuralNetTools)
plotnet(red)

pred=predict(red,testeo)
pred2=predict(red,entreno)
pred
pred2
