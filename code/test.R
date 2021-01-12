d <- read.csv("data.csv")
str(d)
library(ggplot2)

t <- table(d$Churn, d$PaymentMethod)
t
df <- data.frame(
  Churn=rep(c("No", "Yes"), 4),
  #reason=rep(c("No", "No internet service", "Yes"), each=2),
  reason=rep(c("Bank transfer", "Credit card", "Electronic check", "Mailed check"), each=2),
  count=c(t[1,1], t[2,1],
          t[1,2], t[2,2],
          t[1,3], t[2,3],
          t[1,4], t[2,4]),
  ratio=c(t[1,1]/sum(t[,1]), t[2,1]/sum(t[,1]),
          t[1,2]/sum(t[,2]), t[2,2]/sum(t[,2]),
          t[1,3]/sum(t[,3]), t[2,3]/sum(t[,3]),
          t[1,4]/sum(t[,4]), t[2,4]/sum(t[,4]))
)
df

df$ratio <- paste0(round(df$ratio*100), "%")
df$reason <- factor(df$reason, levels=unique(df$reason))

ggplot(df, aes(x=reason, y=count, fill=Churn)) +
  geom_bar(stat = "identity", position = position_fill(), width = .7) +
  geom_text(aes(label=ratio), position = position_fill(0.5), size=4) +
  xlab("") + ylab("") +
  theme(panel.grid = element_blank())
  
  
ggplot(d, aes(x=MonthlyCharges)) +
  geom_density(kernel="gaussian") +
  xlab("")