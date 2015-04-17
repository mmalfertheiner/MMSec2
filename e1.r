require("ROCR")

setwd("/home/martin/Projects/MMSec2")

data <- read.table("question1.txt", sep=",", header=FALSE)

pred <- prediction(data[,1],data[,2])
perf <- performance(pred, measure = "tpr", x.measure = "fpr")

png(filename="roc.png")
plot(perf, col="blue")
abline(0,1,col="grey")
abline(1,-1,col="red")

