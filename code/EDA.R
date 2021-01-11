#library
library(ggplot2)

#import data
setwd("C:/Users/user/Desktop/DataScience_1091/finalproject-group3/data")
d = read.csv("rawdata.csv")

#EDA
summary(data)

#Churn
churn.tab <- table(d$Churn)
churn.freq <- data.frame(churn.tab)
names(churn.freq)[1] <- "Churn"
churn.Freq <- sapply(churn.freq[2],as.numeric)
churn <- ggplot(data = churn.freq, aes(x="",y=Freq,fill=Churn))+
  geom_bar(width=1,stat = "identity")+
  coord_polar(theta = "y", start = 0)+
  geom_text(stat = "identity",aes(label = paste(round(100*(churn.Freq/sum(churn.Freq)),digits = 2),"%")),position=position_stack(vjust = 0.6))+
  ggtitle("Churn")+
  theme_void()
ggsave( churn,filename ="Churn.png",width = 4,height = 4)


#gender
gender.tab <- table(d$gender)
gender.freq <- data.frame(gender.tab)
names(gender.freq)[1] <- "gender"
gender.Freq <- sapply(gender.freq[2],as.numeric)
gender <- ggplot(data = gender.freq, aes(x="",y=Freq,fill=gender))+
                 geom_bar(width=1,stat = "identity")+
                 coord_polar(theta = "y", start = 0)+
                 geom_text(stat = "identity",aes(label = paste(round(100*(gender.Freq/sum(gender.Freq)),digits = 2),"%")),position=position_stack(vjust = 0.3))+
                 ggtitle("Gender")+
                 theme_void()
ggsave(gender,filename = "gender.png",width = 4,height = 4)

#SeniorCitizen
d$SeniorCitizen <- as.factor(ifelse(d$SeniorCitizen==0, "No", "Yes"))
senior.tab <- table(d$SeniorCitizen)
senior.freq <- data.frame(senior.tab)
names(senior.freq)[1] <- "seniorCitizen"
senior.Freq <- sapply(senior.freq[2],as.numeric)
senior <- ggplot(data = senior.freq, aes(x="",y=Freq,fill=seniorCitizen))+
                geom_bar(width=1,stat = "identity")+
                coord_polar(theta = "y", start = 0)+
                geom_text(stat = "identity",aes(label = paste(round(100*(senior.Freq/sum(senior.Freq)),digits = 2),"%")),position=position_stack(vjust = 0.6))+
                ggtitle("SeniorCitizen")+
                theme_void()
ggsave( senior,filename ="seniorCitizen.png",width = 4,height = 4)

#Partner
partner.tab <- table(d$Partner)
partner.freq <- data.frame(partner.tab)
names(partner.freq)[1] <- "partner"
partner.Freq <- sapply(partner.freq[2],as.numeric)
partner <- ggplot(data = partner.freq, aes(x="",y=Freq,fill=partner))+
  geom_bar(width=1,stat = "identity")+
  coord_polar(theta = "y", start = 0)+
  geom_text(stat = "identity",aes(label = paste(round(100*(partner.Freq/sum(partner.Freq)),digits = 2),"%")),position=position_stack(vjust = 0.6))+
  ggtitle("Partner")+
  theme_void()
ggsave( partner,filename ="partner.png",width = 4,height = 4)

#Dependent
dependent.tab <- table(d$Dependents)
dependent.freq <- data.frame(dependent.tab)
names(dependent.freq )[1] <- "dependent"
dependent.Freq <- sapply(dependent.freq[2],as.numeric)
dependent <- ggplot(data = dependent.freq, aes(x="",y=Freq,fill=dependent))+
  geom_bar(width=1,stat = "identity")+
  coord_polar(theta = "y", start = 0)+
  geom_text(stat = "identity",aes(label = paste(round(100*(dependent.Freq/sum(dependent.Freq)),digits = 2),"%")),position=position_stack(vjust = 0.6))+
  ggtitle("Dependent")+
  theme_void()
ggsave(dependent,filename ="dependent.png",width = 4,height = 4)

#PhoneService 
phoneService.tab <- table(d$PhoneService)
phoneService.freq <- data.frame(phoneService.tab)
names(phoneService.freq)[1] <- "phoneService"
phoneService.Freq <- sapply(phoneService.freq[2],as.numeric)
phoneService <- ggplot(data = phoneService.freq, aes(x="",y=Freq,fill=phoneService))+
  geom_bar(width=1,stat = "identity")+
  coord_polar(theta = "y", start = 0)+
  geom_text(stat = "identity",aes(label = paste(round(100*(phoneService.Freq/sum(phoneService.Freq)),digits = 2),"%")),position=position_stack(vjust = 0.6))+
  ggtitle("phoneService")+
  theme_void()
ggsave( phoneService,filename ="phoneService.png",width = 4,height = 4)

#multipleLines 
multipleLines.tab <- table(d$MultipleLines)
multipleLines.freq <- data.frame(multipleLines.tab)
names(multipleLines.freq)[1] <- "multipleLines"
multipleLines.Freq <- sapply(multipleLines.freq[2],as.numeric)
multipleLines <- ggplot(data = multipleLines.freq, aes(x="",y=Freq,fill=multipleLines))+
  geom_bar(width=1,stat = "identity")+
  coord_polar(theta = "y", start = 0)+
  geom_text(stat = "identity",aes(label = paste(round(100*(multipleLines.Freq/sum(multipleLines.Freq)),digits = 2),"%")),position=position_stack(vjust = 0.6))+
  ggtitle("multipleLines")+
  theme_void()
ggsave( multipleLines,filename ="multipleLines.png",width = 4,height = 4)

#internetService 
internetService.tab <- table(d$InternetService)
internetService.freq <- data.frame(internetService.tab)
names(internetService.freq)[1] <- "internetService"
internetService.Freq <- sapply(internetService.freq[2],as.numeric)
internetService <- ggplot(data = internetService.freq, aes(x="",y=Freq,fill=internetService))+
  geom_bar(width=1,stat = "identity")+
  coord_polar(theta = "y", start = 0)+
  geom_text(stat = "identity",aes(label = paste(round(100*(internetService.Freq/sum(internetService.Freq)),digits = 2),"%")),position=position_stack(vjust = 0.6))+
  ggtitle("InternetService")+
  theme_void()
ggsave( internetService,filename ="internetService.png",width = 4,height = 4)

#onlineSecurity 
onlineSecurity.tab <- table(d$OnlineSecurity)
onlineSecurity.freq <- data.frame(onlineSecurity.tab)
names(onlineSecurity.freq)[1] <- "onlineSecurity"
onlineSecurity.Freq <- sapply(onlineSecurity.freq[2],as.numeric)
onlineSecurity <- ggplot(data = onlineSecurity.freq, aes(x="",y=Freq,fill=onlineSecurity))+
  geom_bar(width=1,stat = "identity")+
  coord_polar(theta = "y", start = 0)+
  geom_text(stat = "identity",aes(label = paste(round(100*(onlineSecurity.Freq/sum(onlineSecurity.Freq)),digits = 2),"%")),position=position_stack(vjust = 0.6))+
  ggtitle("onlineSecurity")+
  theme_void()
ggsave( onlineSecurity,filename ="onlineSecurity.png",width = 4,height = 4)


#onlineBackup 
onlineBackup.tab <- table(d$OnlineBackup)
onlineBackup.freq <- data.frame(onlineBackup.tab)
names(onlineBackup.freq)[1] <- "onlineBackup"
onlineBackup.Freq <- sapply(onlineBackup.freq[2],as.numeric)
onlineBackup <- ggplot(data = onlineBackup.freq, aes(x="",y=Freq,fill=onlineBackup))+
  geom_bar(width=1,stat = "identity")+
  coord_polar(theta = "y", start = 0)+
  geom_text(stat = "identity",aes(label = paste(round(100*(onlineBackup.Freq/sum(onlineBackup.Freq)),digits = 2),"%")),position=position_stack(vjust = 0.6))+
  ggtitle("onlineBackup")+
  theme_void()
ggsave( onlineBackup,filename ="onlineBackup.png",width = 4,height = 4)

#deviceProtection 
deviceProtection.tab <- table(d$DeviceProtection)
deviceProtection.freq <- data.frame(deviceProtection.tab)
names(deviceProtection.freq)[1] <- "deviceProtection"
deviceProtection.Freq <- sapply(deviceProtection.freq[2],as.numeric)
deviceProtection <- ggplot(data = deviceProtection.freq, aes(x="",y=Freq,fill=deviceProtection))+
  geom_bar(width=1,stat = "identity")+
  coord_polar(theta = "y", start = 0)+
  geom_text(stat = "identity",aes(label = paste(round(100*(deviceProtection.Freq/sum(deviceProtection.Freq)),digits = 2),"%")),position=position_stack(vjust = 0.6))+
  ggtitle("DeviceProtection")+
  theme_void()
ggsave( deviceProtection,filename ="deviceProtection.png",width = 4,height = 4)


#techSupport  
techSupport.tab <- table(d$TechSupport)
techSupport.freq <- data.frame(techSupport.tab)
names(techSupport.freq)[1] <- "techSupport"
techSupport.Freq <- sapply(techSupport.freq[2],as.numeric)
techSupport <- ggplot(data = techSupport.freq, aes(x="",y=Freq,fill=techSupport))+
  geom_bar(width=1,stat = "identity")+
  coord_polar(theta = "y", start = 0)+
  geom_text(stat = "identity",aes(label = paste(round(100*(techSupport.Freq/sum(techSupport.Freq)),digits = 2),"%")),position=position_stack(vjust = 0.6))+
  ggtitle("techSupport")+
  theme_void()
ggsave( techSupport,filename ="techSupport.png",width = 4,height = 4)

#streamingTV  
streamingTV.tab <- table(d$StreamingTV)
streamingTV.freq <- data.frame(streamingTV.tab)
names(streamingTV.freq)[1] <- "streamingTV"
streamingTV.Freq <- sapply(streamingTV.freq[2],as.numeric)
streamingTV <- ggplot(data = streamingTV.freq, aes(x="",y=Freq,fill=streamingTV))+
  geom_bar(width=1,stat = "identity")+
  coord_polar(theta = "y", start = 0)+
  geom_text(stat = "identity",aes(label = paste(round(100*(streamingTV.Freq/sum(streamingTV.Freq)),digits = 2),"%")),position=position_stack(vjust = 0.6))+
  ggtitle("streamingTV")+
  theme_void()
ggsave( streamingTV,filename ="streamingTV.png",width = 4,height = 4)

#streamingMovies  
streamingMovies.tab <- table(d$StreamingMovies)
streamingMovies.freq <- data.frame(streamingMovies.tab)
names(streamingMovies.freq)[1] <- "streamingMovies"
streamingMovies.Freq <- sapply(streamingMovies.freq[2],as.numeric)
streamingMovies <- ggplot(data = streamingMovies.freq, aes(x="",y=Freq,fill=streamingMovies))+
  geom_bar(width=1,stat = "identity")+
  coord_polar(theta = "y", start = 0)+
  geom_text(stat = "identity",aes(label = paste(round(100*(streamingMovies.Freq/sum(streamingMovies.Freq)),digits = 2),"%")),position=position_stack(vjust = 0.6))+
  ggtitle("streamingMovies")+
  theme_void()
ggsave( streamingMovies,filename ="streamingMovies.png",width = 4,height = 4)


#contract  
contract.tab <- table(d$Contract)
contract.freq <- data.frame(contract.tab)
names(contract.freq)[1] <- "contract"
contract.Freq <- sapply(contract.freq[2],as.numeric)
contract <- ggplot(data = contract.freq, aes(x="",y=Freq,fill=contract))+
  geom_bar(width=1,stat = "identity")+
  coord_polar(theta = "y", start = 0)+
  geom_text(stat = "identity",aes(label = paste(round(100*(contract.Freq/sum(contract.Freq)),digits = 2),"%")),position=position_stack(vjust = 0.6))+
  ggtitle("contract")+
  theme_void()
ggsave( contract,filename ="contract.png",width = 4,height = 4)


#paperlessBilling   
paperlessBilling.tab <- table(d$PaperlessBilling)
paperlessBilling.freq <- data.frame(paperlessBilling.tab)
names(paperlessBilling.freq)[1] <- "paperlessBilling"
paperlessBilling.Freq <- sapply(paperlessBilling.freq[2],as.numeric)
paperlessBilling <- ggplot(data = paperlessBilling.freq, aes(x="",y=Freq,fill=paperlessBilling))+
  geom_bar(width=1,stat = "identity")+
  coord_polar(theta = "y", start = 0)+
  geom_text(stat = "identity",aes(label = paste(round(100*(paperlessBilling.Freq/sum(paperlessBilling.Freq)),digits = 2),"%")),position=position_stack(vjust = 0.6))+
  ggtitle("paperlessBilling")+
  theme_void()
ggsave( paperlessBilling,filename ="paperlessBilling.png",width = 4,height = 4)

#paymentMethod   
paymentMethod.tab <- table(d$PaymentMethod)
paymentMethod.freq <- data.frame(paymentMethod.tab)
names(paymentMethod.freq)[1] <- "paymentMethod"
paymentMethod.Freq <- sapply(paymentMethod.freq[2],as.numeric)
paymentMethod <- ggplot(data = paymentMethod.freq, aes(x="",y=Freq,fill=paymentMethod))+
  geom_bar(width=1,stat = "identity")+
  coord_polar(theta = "y", start = 0)+
  geom_text(stat = "identity",aes(label = paste(round(100*(paymentMethod.Freq/sum(paymentMethod.Freq)),digits = 2),"%")),position=position_stack(vjust = 0.6))+
  ggtitle("paymentMethod")+
  theme_void()
ggsave( paymentMethod,filename ="paymentMethod.png",width = 4,height = 4)


#gender_churn
gender.churn.tab <- table(data$gender,data$Churn)
gender.churn.freq <- data.frame(gender.churn.tab)
gender.freq.churn <- subset(gender.churn.freq,Var2=="Yes") 
names(gender.freq.churn)[1] <- "gender"
gender.churn.Freq <- sapply(gender.freq.churn[3],as.numeric)
gender.churn <- ggplot(data = gender.freq.churn, aes(x="",y=Freq,fill=gender))+
  geom_bar(width=1,stat = "identity")+
  coord_polar(theta = "y", start = 0)+
  geom_text(stat = "identity",aes(label = paste(round(100*(gender.churn.Freq/sum(gender.churn.Freq)),digits = 2),"%")),position=position_stack(vjust = 0.3))+
  ggtitle(" Churn Customers Gender Distribution")+
  theme_void()
ggsave(gender.churn,filename = "gender_churn.png",width = 4,height = 4)





#gender_nonchurn
gender.churn.tab <- table(data$gender,data$Churn)
gender.churn.freq <- data.frame(gender.churn.tab)
gender.freq.nonchurn <- subset(gender.churn.freq,Var2=="No") 
names(gender.freq.nonchurn)[1] <- "gender"
gender.nonchurn.Freq <- sapply(gender.freq.nonchurn[3],as.numeric)
gender.nonchurn <- ggplot(data = gender.freq.nonchurn, aes(x="",y=Freq,fill=gender))+
  geom_bar(width=1,stat = "identity")+
  coord_polar(theta = "y", start = 0)+
  geom_text(stat = "identity",aes(label = paste(round(100*(gender.nonchurn.Freq/sum(gender.nonchurn.Freq)),digits = 2),"%")),position=position_stack(vjust = 0.3))+
  ggtitle(" Nonchurn Customers Gender Distribution")+
  theme_void()
ggsave(gender.nonchurn,filename = "gender_nonchurn.png",width = 4,height = 4)

#SeniorCitizen_churn
senior.churn.tab <- table(data$SeniorCitizen,data$Churn)
senior.churn.freq <- data.frame(senior.churn.tab)
senior.freq.churn <- subset(senior.churn.freq,Var2=="Yes") 
names(senior.freq.churn)[1] <- "SeniorCitizen"
senior.churn.Freq <- sapply(senior.freq.churn[3],as.numeric)
senior.churn <- ggplot(data = senior.freq.churn, aes(x="",y=Freq,fill=SeniorCitizen))+
  geom_bar(width=1,stat = "identity")+
  coord_polar(theta = "y", start = 0)+
  geom_text(stat = "identity",aes(label = paste(round(100*(senior.churn.Freq/sum(senior.churn.Freq)),digits = 2),"%")),position=position_stack(vjust = 0.6))+
  ggtitle("Churn Customers SeniorCitizen Distribution")+
  theme_void()
ggsave(senior.churn,filename ="seniorCitizen_churn.png",width = 4,height = 4)

#SeniorCitizen_nonchurn
senior.churn.tab <- table(data$SeniorCitizen,data$Churn)
senior.churn.freq <- data.frame(senior.churn.tab)
senior.freq.nonchurn <- subset(senior.churn.freq,Var2=="No") 
names(senior.freq.nonchurn)[1] <- "SeniorCitizen"
senior.nonchurn.Freq <- sapply(senior.freq.nonchurn[3],as.numeric)
senior.nonchurn <- ggplot(data = senior.freq.nonchurn, aes(x="",y=Freq,fill=SeniorCitizen))+
  geom_bar(width=1,stat = "identity")+
  coord_polar(theta = "y", start = 0)+
  geom_text(stat = "identity",aes(label = paste(round(100*(senior.nonchurn.Freq/sum(senior.nonchurn.Freq)),digits = 2),"%")),position=position_stack(vjust = 0.6))+
  ggtitle("NonChurn Customers SeniorCitizen Distribution")+
  theme_void()
ggsave(senior.nonchurn,filename ="seniorCitizen_nonchurn.png",width = 4,height = 4)

#partner_churn
partner.churn.tab <- table(data$Partner,data$Churn)
partner.churn.freq <- data.frame(partner.churn.tab)
partner.freq.churn <- subset(partner.churn.freq,Var2=="Yes") 
names(partner.freq.churn)[1] <- "Partner"
partner.churn.Freq <- sapply(partner.freq.churn[3],as.numeric)
partner.churn <- ggplot(data = partner.freq.churn, aes(x="",y=Freq,fill=Partner))+
  geom_bar(width=1,stat = "identity")+
  coord_polar(theta = "y", start = 0)+
  geom_text(stat = "identity",aes(label = paste(round(100*(partner.churn.Freq/sum(partner.churn.Freq)),digits = 2),"%")),position=position_stack(vjust = 0.6))+
  ggtitle("Churn Customers Partner Distribution")+
  theme_void()
ggsave(partner.churn,filename ="partner_churn.png",width = 4,height = 4)

#partner_nonchurn
partner.churn.tab <- table(data$Partner,data$Churn)
partner.churn.freq <- data.frame(partner.churn.tab)
partner.freq.nonchurn <- subset(partner.churn.freq,Var2=="No") 
names(partner.freq.nonchurn)[1] <- "Partner"
partner.nonchurn.Freq <- sapply(partner.freq.nonchurn[3],as.numeric)
partner.nonchurn <- ggplot(data = partner.freq.nonchurn, aes(x="",y=Freq,fill=Partner))+
  geom_bar(width=1,stat = "identity")+
  coord_polar(theta = "y", start = 0)+
  geom_text(stat = "identity",aes(label = paste(round(100*(partner.nonchurn.Freq/sum(partner.nonchurn.Freq)),digits = 2),"%")),position=position_stack(vjust = 0.6))+
  ggtitle("NonChurn Customers Partner Distribution")+
  theme_void()
ggsave(partner.nonchurn,filename ="partner_nonchurn.png",width = 4,height = 4)

#dependent_churn
dependent.churn.tab <- table(data$Dependent,data$Churn)
dependent.churn.freq <- data.frame(dependent.churn.tab)
dependent.freq.churn <- subset(dependent.churn.freq,Var2=="Yes") 
names(dependent.freq.churn)[1] <- "Dependent"
dependent.churn.Freq <- sapply(dependent.freq.churn[3],as.numeric)
dependent.churn <- ggplot(data = dependent.freq.churn, aes(x="",y=Freq,fill=Dependent))+
  geom_bar(width=1,stat = "identity")+
  coord_polar(theta = "y", start = 0)+
  geom_text(stat = "identity",aes(label = paste(round(100*(dependent.churn.Freq/sum(dependent.churn.Freq)),digits = 2),"%")),position=position_stack(vjust = 0.6))+
  ggtitle("Churn Customers Dependent Distribution")+
  theme_void()
ggsave(dependent.churn,filename ="dependent_churn.png",width = 4,height = 4)

#dependent_nonchurn
dependent.churn.tab <- table(data$Dependent,data$Churn)
dependent.churn.freq <- data.frame(dependent.churn.tab)
dependent.freq.nonchurn <- subset(dependent.churn.freq,Var2=="No") 
names(dependent.freq.nonchurn)[1] <- "Dependent"
dependent.nonchurn.Freq <- sapply(dependent.freq.nonchurn[3],as.numeric)
dependent.nonchurn <- ggplot(data = dependent.freq.nonchurn, aes(x="",y=Freq,fill=Dependent))+
  geom_bar(width=1,stat = "identity")+
  coord_polar(theta = "y", start = 0)+
  geom_text(stat = "identity",aes(label = paste(round(100*(dependent.nonchurn.Freq/sum(dependent.nonchurn.Freq)),digits = 2),"%")),position=position_stack(vjust = 0.6))+
  ggtitle("NonChurn Customers Dependent Distribution")+
  theme_void()
ggsave(dependent.nonchurn,filename ="dependent_nonchurn.png",width = 4,height = 4)


