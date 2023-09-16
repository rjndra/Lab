#define x variable as a series from 1 to 30
x <- c(1:30)
y <- x^3
hist(x)
table(x)

hist(y)
table(y)
#graph range of y i.e 0,5000,1000,... shown by creating range & then using formula of some log

summary(x)

#ouliers = mean+-2*sd

#outlier for x = median +- 1.5 * IQR
#IQR = Q3 - Q1 = 14.5 #.... Q3 = 75%....Q1 = 25%
#15.5 + (1.5*14.5) #= 37.25
#15.5- (1.5*14.5)  #= -6.25


summary(y)
#outlier for y = median +- 1.5 * IQR
#IQR = 11787.2-566.2 = 11221
IQR(y)
#7207.5 + 1.5 * 11221   # 16831.5
#7207.5 - 1.5 * 11221   # -9624
boxplot(y)

#create 2k boxplot


#creating data frame
df <- data.frame(x, y)
print(df)
#colnames(df) <- c("num", "cube")
#print(df)

#scatterplot
plot(df$y, df$x)
plot(df$x, df$y)

cor(df$x, df$y)
cor(x,y)
#default method pearson
cor(x,y, method = c("spearman"))

df$z <- log(df$y)
plot(df$x, df$z)
cor(df$z,df$x)

