#lokasi file
setwd("D:/semester 3 Teknik Informatika/data mining/Tugas Besar")

#pembacaan dataset
dataset <- read.csv("D:/semester 3 Teknik Informatika/data mining/Tugas Besar/cervical_cancer.csv", sep = "," )

#library
library(C50)
library(printr)

#melihat tipe data
class(dataset)
class(dataset$ca_cervix)

#convert tipe data character to factor
dataset$ca_cervix <- as.factor(dataset$ca_cervix)
class(dataset$ca_cervix)

#pembuatan model
model <- C5.0(ca_cervix ~., data = dataset)

#melihat hasil model
model
summary(model)

#gambar model
plot(model)

#membuat dataset
datatesting <- dataset[,1:19]

#prediksi
predictions <- predict(model, datatesting)

#bandingkan hasil prediksi dengan dataset
table(predictions, dataset$ca_cervix)
