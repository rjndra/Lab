library(tidyverse)

#non-normal lai normal lanu z-score/z-transform use garne

mpg

ggplot(data=mpg) +
  geom_point(mapping = aes(x=displ, y=hwy))

ggplot(data=mpg, aes(x=displ, y=hwy)) + 
  geom_point()


ggplot(data=mpg)+
  aes(x=displ, y=hwy) + 
  geom_point()

#it seems like to have inverse relationship between these two data i.e. cars with big engines
# use more fuel

# This graph seems to be tentative linear so we can get Pearson correlation for confirmation
cor(mpg$displ, mpg$hwy)
# High degree of negative correlation (0.75-1 is high degree)

# Till now we got descriptive visual. Now we confirm using statistically valid by using cor hypothesis

# hypothesis maa sample maa vako data ra population maa vako data same ho vanxa... random sampling

# Ho (null hypothesis) : r=0 (r is pearson cor, R is spearman)  
# H1 (alternate ") : r!=0  (pearson cor)

# Ho : rho (ρ) =>   >0.05 (p-value, 0.05 error) ...yo correct kina vane hami population maa check garxum
# H1 : rho != 0   =>   <= 0.05

cor.test(mpg$displ, mpg$hwy)
# here, p-value < 2.2e-16
# is less than 0.05 so valid


# t-test t ~ (1-r^2) / sqrt(n-2)

#one way anova test for linear testing of relation

# Ho : p > 0.05 xa vane linear
# H1 : p <= 0.05

# 95% confidence error --  r +- 1.96 * SE(r) .... SE - standard error
# X^-(mean) +- 1.96 * SE(X-)........ SE(X-) = s.d/(sqrt(??))




ggplot(mpg, aes(x=displ, y=hwy, color=class)) + 
  geom_point()
#class variable in mpg


ggplot(mpg, aes(x=displ, y=hwy, size=class)) + 
  geom_point()



ggplot(mpg, aes(x=displ, y=hwy, alpha=class, shape=class)) + 
  geom_point()


ggplot(mpg, aes(x=displ, y=hwy, color="blue")) + 
  geom_point()

ggplot(mpg, aes(x=displ, y=hwy)) + 
  geom_point(color="blue")

# orange color when used in aes


# simpson paradox ?

ggplot(mpg) + 
  geom_point(aes(displ, hwy))+
  facet_wrap(~class, nrow = 2)



ggplot(mpg) + 
  geom_point(aes(displ, hwy))+
  facet_grid(drv~cyl)


ggplot(mpg) + 
  geom_point(aes(displ, hwy))+
  facet_grid(drv~.)


ggplot(mpg) + 
  geom_point(aes(displ, hwy))+
  facet_grid(.~cyl)


ggplot(mpg) + 
  geom_smooth(aes(displ, hwy))
# loess curve


ggplot(mpg) + 
  geom_smooth(aes(displ, hwy, linetype=drv))


ggplot(mpg, aes(displ, hwy, linetype=drv)) + 
  geom_point(aes(color=class)) +
  geom_smooth(data=filter(mpg, class=="subcompact"), fe=FALSE)


ggplot(diamonds)+
  stat_count(aes(cut))

ggplot(diamonds)+
  geom_bar(aes(cut))




ggplot(diamonds) + 
  stat_summary(mapping=aes(cut,depth))


ggplot(diamonds) + 
  stat_summary(
    mapping=aes(cut,depth),
    fun.min = min,
    fun.max = max,
    fun = median
  )


ggplot(diamonds)+
  geom_bar(aes(cut, colour=cut))


ggplot(diamonds)+
  geom_bar(aes(cut, fill=cut))


ggplot(diamonds)+
  geom_bar(aes(cut, fill=clarity))
#stack maa vayera basda tyaslai position adjustment vanxa


ggplot(diamonds, aes(cut, fill=clarity))+
  geom_bar(alpha=1/5, position = "identity")



ggplot(diamonds, aes(cut, color=clarity))+
  geom_bar(fill=NA, position = "identity")
