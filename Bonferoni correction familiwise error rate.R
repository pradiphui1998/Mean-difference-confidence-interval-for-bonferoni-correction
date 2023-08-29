#create wide dataset
data <- data.frame(A = runif(20, 2, 5),
                   B = runif(20, 3, 5),
                   C = runif(20, 3, 6),
                   D = runif(20, 4, 6))

#convert to long dataset for ANOVA
data_long <- gather(data, key = "group", value = "amount", A, B, C, D)

anova_model <- aov(amount ~ group, data = data_long)

plot(TukeyHSD(anova_model, conf.level=.95))