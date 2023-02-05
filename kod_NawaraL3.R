library(naivebayes)
data = iris
#data<-subset(data, select = -Sepal.Length)
#data<-subset(data, select = -Sepal.Width)
#data<-subset(data, select = -Petal.Length)
#data<-subset(data, select = -Petal.Width)

idx = sample(2,150,replace = T, prob = c(0.8, 0.2))

train = data[idx==1,]
test = data[idx==2,]

model = naive_bayes(Species ~ ., data = train)
plot(model)

p1=predict(model,test)
tab=table(p1,test$Species) #confusion matrix 
tab

sum(diag((tab)))/sum(tab) #jakość/ dobroć klasyfikatora


