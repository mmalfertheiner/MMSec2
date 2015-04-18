require("ROCR")

setwd("/home/martin/Projects/MMSec2")

data <- read.table("question1.txt", sep=",", header=FALSE)

#Label ordering: negative label first, positive label second
pred <- prediction(data[,1],data[,2], c("cover", "stego"))
perf <- performance(pred, measure = "tpr", x.measure = "fpr")


png(filename="roc.png")
plot(perf, col="blue")
abline(0,1, col="grey")
abline(1,-1, col="red")

dev.off()

df <- with(attributes(pred), data.frame(tp=tp[[1]], fn=fn[[1]], tn=tn[[1]], fp=fp[[1]], TMR=tp[[1]]/(tp[[1]]+fn[[1]]), TNMR=tn[[1]]/(tn[[1]]+fp[[1]])))


i_eer <- with(df, which.min(abs(TMR-TNMR)))
EER <- with(df[i_eer,], mean(c(TMR,TNMR)))

#Result: Equal error rate: 0.953125

print(EER)
