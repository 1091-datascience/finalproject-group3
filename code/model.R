set.seed(2021)
library(rpart)
library(randomForest)
library(mice)
library(ggplot2)

#partition function
partition <- function(n,k){
  sizes = c(0)
  for (i in 1:k) {
    first = 1 + (((i - 1) * n) %/% k)
    last = ((i * n) %/% k)
    sizes = append(sizes, last - first + 1+ sizes[i])
  }
  sizes = append(sizes, 0)
  return(sizes)
}

#read parameters
args = commandArgs(trailingOnly=TRUE)
if (length(args)==0) {
  stop("USAGE: Rscript code/your_script.R --fold n --input data/training.csv  --report performance.csv --predict predict.csv
", call.=FALSE)
}

#data mining
d <- read.csv(args[4])
d <- d[,-1]
d$SeniorCitizen <- as.factor(ifelse(d$SeniorCitizen==0, "No", "Yes"))
mice <- mice(d)
d <- complete(mice, action = 1)
#partner
#dependents 
#tenure 切區間
d$tenure <- as.factor(ifelse(d$tenure>20, "long", "short"))
d$MultipleLines <- as.character(d$MultipleLines)
d[d$MultipleLines=="No phone service", ]$MultipleLines <- "No"
d$MultipleLines <- as.factor(d$MultipleLines)
d$OnlineSecurity <- as.character(d$OnlineSecurity)
d[d$OnlineSecurity=="No internet service", ]$OnlineSecurity <- "No"
d$OnlineSecurity <- as.factor(d$OnlineSecurity)
d$OnlineBackup <- as.character(d$OnlineBackup)
d[d$OnlineBackup=="No internet service", ]$OnlineBackup <- "No"
d$OnlineBackup <- as.factor(d$OnlineBackup)
d$DeviceProtection <- as.character(d$DeviceProtection)
d[d$DeviceProtection=="No internet service", ]$DeviceProtection <- "No"
d$DeviceProtection <- as.factor(d$DeviceProtection)
d$TechSupport <- as.character(d$TechSupport)
d[d$TechSupport=="No internet service", ]$TechSupport <- "No"
d$TechSupport <- as.factor(d$TechSupport)
d$StreamingTV <- as.character(d$StreamingTV)
d[d$StreamingTV=="No internet service", ]$StreamingTV <- "No"
d$StreamingTV <- as.factor(d$StreamingTV)
d$StreamingMovies <- as.character(d$StreamingMovies)
d[d$StreamingMovies=="No internet service", ]$StreamingMovies <- "No"
d$StreamingMovies <- as.factor(d$StreamingMovies)
#MonthlyCharges 切區間
d$MonthlyCharges <- as.factor(ifelse(d$MonthlyCharges>66, ">66", 
                                     ifelse(d$MonthlyCharges>50, "50~66", 
                                            ifelse(d$MonthlyCharges>36, "36~50", "<36"))))
d$TotalCharges <- as.factor(ifelse(d$TotalCharges>2500, ">2500",
                                   ifelse(d$TotalCharges>800, "800~2500", "<800")))
d$PaymentMethod <- as.factor(ifelse(d$PaymentMethod=="Electronic check", "Yes", "No"))
d$Contract <- as.factor(ifelse(d$Contract=="Month-to-month", "short", "long"))

d <- d[sample(nrow(d)),]
#EDA挑變數
#d <- d[,-c(1,3,4,6,7,13,14)]
#logistic挑變數
#d <- d[,-c(1,3,6,9,10,11,12)]

k <- as.numeric(args[2])
sizes <- partition(nrow(d),k)

accuracy <- matrix(0,k+2,4)
accuracy[1,1] <- "set"
accuracy[1,2] <- "training"
accuracy[1,3] <- "validation"
accuracy[1,4] <- "test"
for (i in 1:k){
  #split data
  if (sizes[i+2]>sizes[i+1]){
    d_test <- d[((sizes[i]+1):sizes[i+1]),]
    d_validation <- d[((sizes[i+1]+1):sizes[i+2]),]
    d_train <- d[-((sizes[i]+1):sizes[i+2]),]
  } else {
    d_test <- d[((sizes[i]+1):sizes[i+1]),]
    d_validation <- d[((sizes[1]+1):sizes[2]),]
    d_train <- d[((sizes[2]+1):sizes[i]),]
  }
  
  if (i<(k+1)/3){
    accuracy[i+1,1]<-paste("logistic", i, sep="")
    #train model
    model <- glm(Churn ~ SeniorCitizen + Dependents + tenure + PhoneService + 
                   MultipleLines + InternetService + OnlineSecurity + OnlineBackup + 
                   TechSupport + StreamingTV + StreamingMovies + Contract + 
                   PaperlessBilling + PaymentMethod + TotalCharges, data = d_train, family = "binomial")
    #predict model with training data
    train_result <- predict(model, newdata = d_train)
    train_pred <- table(train_result>.5, d_train$Churn)
    train_accuracy2 <- (train_pred[1,1]+train_pred[2,2])/sum(train_pred)
    #predict model with validation data
    validation_result <- predict(model, newdata = d_validation)
    validation_pred <- table(validation_result>.5, d_validation$Churn)
    validation_accuracy2 <- (validation_pred[1,1]+validation_pred[2,2])/sum(validation_pred)
    #final model
    f_train <- rbind(d_train,d_validation)
    flm_model <- glm(Churn ~ SeniorCitizen + Dependents + tenure + PhoneService + 
                     MultipleLines + InternetService + OnlineSecurity + OnlineBackup + 
                     TechSupport + StreamingTV + StreamingMovies + Contract + 
                     PaperlessBilling + PaymentMethod + TotalCharges, data = f_train, family = "binomial")
    #final prediction
    test_result <- predict(f_model, newdata = d_test)
    test_pred <- table(test_result>.5, d_test$Churn)
    test_accuracy2 <- (test_pred[1,1]+test_pred[2,2])/sum(test_pred)
    #accuracy performance
    accuracy[i+1,2] <- round(train_accuracy2, digits = 2)
    accuracy[i+1,3] <- round(validation_accuracy2, digits = 2)
    accuracy[i+1,4] <- round(test_accuracy2, digits = 2)
  }else if(i<(k+10)/3){
    accuracy[i+1,1]<-paste("rpart", i, sep="")
    #train model
    model <- rpart(Churn ~ SeniorCitizen + Dependents + tenure + PhoneService + 
                     MultipleLines + InternetService + OnlineSecurity + OnlineBackup + 
                     TechSupport + StreamingTV + StreamingMovies + Contract + 
                     PaperlessBilling + PaymentMethod + TotalCharges, data = d_train, method = "class")
    #predict model with training data
    train_result <- predict(model, newdata = d_train, type = "class")
    train_pred <- table(train_result, d_train$Churn)
    train_accuracy2 <- (train_pred[1,1]+train_pred[2,2])/sum(train_pred)
    #predict model with validation data
    validation_result <- predict(model, newdata = d_validation, type = "class")
    validation_pred <- table(validation_result, d_validation$Churn)
    validation_accuracy2 <- (validation_pred[1,1]+validation_pred[2,2])/sum(validation_pred)
    #final model
    f_train <- rbind(d_train,d_validation)
    f_model <- rpart(Churn ~ SeniorCitizen + Dependents + tenure + PhoneService + 
                       MultipleLines + InternetService + OnlineSecurity + OnlineBackup + 
                       TechSupport + StreamingTV + StreamingMovies + Contract + 
                       PaperlessBilling + PaymentMethod + TotalCharges, data = f_train, method = "class")
    #final prediction
    test_result <- predict(f_model, newdata = d_test, type = "class")
    test_pred <- table(test_result, d_test$Churn)
    test_accuracy2 <- (test_pred[1,1]+test_pred[2,2])/sum(test_pred)
    #accuracy performance
    accuracy[i+1,2] <- round(train_accuracy2, digits = 2)
    accuracy[i+1,3] <- round(validation_accuracy2, digits = 2)
    accuracy[i+1,4] <- round(test_accuracy2, digits = 2)
  }else{
    accuracy[i+1,1]<-paste("randomforest", i, sep="")
    #train model
    model <- randomForest(Churn ~  SeniorCitizen + Dependents + tenure + PhoneService + 
                            MultipleLines + InternetService + OnlineSecurity + OnlineBackup + 
                            TechSupport + StreamingTV + StreamingMovies + Contract + 
                            PaperlessBilling + PaymentMethod + TotalCharges, data = d_train)
    #predict model with training data
    train_result <- predict(model, newdata = d_train, type = "class")
    train_pred <- table(train_result, d_train$Churn)
    train_accuracy2 <- (train_pred[1,1]+train_pred[2,2])/sum(train_pred)
    #predict model with validation data
    validation_result <- predict(model, newdata = d_validation, type = "class")
    validation_pred <- table(validation_result, d_validation$Churn)
    validation_accuracy2 <- (validation_pred[1,1]+validation_pred[2,2])/sum(validation_pred)
    #final model
    f_train <- rbind(d_train,d_validation)
    f_model <- randomForest(Churn ~ SeniorCitizen + Dependents + tenure + PhoneService + 
                              MultipleLines + InternetService + OnlineSecurity + OnlineBackup + 
                              TechSupport + StreamingTV + StreamingMovies + Contract + 
                              PaperlessBilling + PaymentMethod + TotalCharges, data = f_train)
    #final prediction
    test_result <- predict(f_model, newdata = d_test, type = "class")
    test_pred <- table(test_result, d_test$Churn)
    test_accuracy2 <- (test_pred[1,1]+test_pred[2,2])/sum(test_pred)
    #accuracy performance
    accuracy[i+1,2] <- round(train_accuracy2, digits = 2)
    accuracy[i+1,3] <- round(validation_accuracy2, digits = 2)
    accuracy[i+1,4] <- round(test_accuracy2, digits = 2)
  }
}

accuracy[k+2,1] <- "ave."
accuracy[k+2,2] <- round(mean(as.numeric(accuracy[(2:(k+1)),2])), digit=2)
accuracy[k+2,3] <- round(mean(as.numeric(accuracy[(2:(k+1)),3])), digit=2)
accuracy[k+2,4] <- round(mean(as.numeric(accuracy[(2:(k+1)),4])), digit=2)

print(accuracy)

test_pred <- data.frame(predict(flm_model, newdata = d_test, type = "response"))
test_pred[,2] <- test_pred[,1]
test_pred[,1] <- c(1:nrow(test_pred))
colnames(test_pred) <- c("Id", "Churn")
View(test_pred)

write.table(accuracy, file=args[6], sep=',', row.names = F, col.names = F, quote = F)
write.table(test_pred, file=args[8], sep=',', row.names = F, quote = F)

summary(model)
summary(f_model)
step(model)

