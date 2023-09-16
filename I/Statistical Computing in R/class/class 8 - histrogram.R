gdcar <- as.data.frame(cars)
hist(gdcar$speed)

hist(gdcar$speed, main="Hist of Cars", xlab = "Speed", ylab = "Distance", col="steelblue")
hist(gdcar$speed, main="Hist of Cars", xlab = "Speed", ylab = "Distance", col="steelblue", breaks = 10)
#breaks shows total numbers of bar+1 (1 for range from 0-x)

#using breaks shows different bargraph which is not bell-shaped, so hist is not good tool to analyze

#recommended qqnorm
qqnorm(gdcar$speed)

qqline(gdcar$speed, col="red")

dens <- density(cars$speed)
plot(dens)
#tentative bell-shape, not actual bell-shape

gd <- as.data.frame(VADeaths)
#pie chart
pie(gd$`Rural Male`, labels = rownames(gd), radius = 1)

gd$piepercent <- round(100*gd$`Rural Male`/sum(gd$`Rural Male`), 1)

pie(gd$`Rural Male`, labels = gd$piepercent, 
    main = " % Deaths by Age groups for Rural Male", 
    col= rainbow(length(gd$`Rural Male`))
    )


plot(gdcar$speed)
plot(gdcar$speed, type="o")


boxplot(mpg~cyl, data=mtcars)

boxplot(mpg~gear, data=mtcars, xlab="Gear Number", ylab = "Miles per Gallon", main = "Mileage Data")
qqnorm(mtcars$mpg)
qqline(mtcars$mpg)

