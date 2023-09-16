# mpg dependent & gears independents

summary(aov(mpg ~ gear, data=mtcars))
#we accept h1 as p<0.05 i.e. atleast one mean/pair is not equal
# and post-hoc test or pairwise comparison is required

TukeyHSD(aov(mpg ~ as.factor(gear), data=mtcars))
#4-3 gear is not same


# Let's check with linear model (regression)

summary(lm(mpg ~ as.factor(gear), data=mtcars))

pairwise.t.test(mtcars$mpg, mtcars$gear, p.adj="none")


#multiple proportion test
# h1: atleast one pairs are not equal

table(mtcars$gear)
prop.test(x=c(15,12,5), n=c(32,32,32))

#p=0.02 < 0.05 so we use pairwise test
pairwise.prop.test(x=c(15,12,5), n=c(32,32,32), correct=F)
#1-3 is significant




