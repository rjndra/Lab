library(ggplot2)

ggplot(diamonds, aes(carat, price)) +
  geom_point()+
  scale_y_continuous() +
  scale_x_continuous() +
  coord_cartesian()

qplot(carat, price, data = diamonds)

ggplot(diamonds, aes(carat, price))+
  geom_point()+
  stat_smooth(method=lm)+
  scale_x_log10()+
  scale_y_log10()


