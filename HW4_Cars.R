install.packages("ggplot2")  
library(ggplot2)          

cars93 <- MASS::Cars93
ggplot(cars93, aes(x = Price, y = Fuel.tank.capacity)) +
  geom_point(color = "grey60") +
  geom_smooth(se = FALSE, method = "loess", formula = y ~ x, color = "#0072B2") +
  scale_x_continuous(
    name = "price (USD)",
    breaks = c(20, 40, 60),
    labels = c("$20,000", "$40,000", "$60,000")
  ) +
  scale_y_continuous(name = "fuel-tank capacity\n(US gallons)")

ggplot(cars93, aes(x = Price, y = Fuel.tank.capacity)) +
  geom_point(color = "grey60") +
  geom_smooth(method = "lm", formula = y ~ x, se = TRUE, color = "#8fe388") +
  scale_x_continuous(
    name = "Price (USD)",
    breaks = c(20, 40, 60),
    labels = c("$20,000", "$40,000", "$60,000")
  ) +
  scale_y_continuous(name = "Fuel-tank capacity\n(US gallons)") +
  ggtitle("Linear Model") +
  theme(plot.title = element_text(size = 14, color = "#8fe388")) 

ggplot(cars93, aes(x = Price, y = Fuel.tank.capacity)) +
  geom_point(color = "grey60") +
  geom_smooth(method = "glm", formula = y ~ x, se = TRUE, color = "#fe8d6d") +
  scale_x_continuous(
    name = "Price (USD)",
    breaks = c(20, 40, 60),
    labels = c("$20,000", "$40,000", "$60,000")
  ) +
  scale_y_continuous(name = "Fuel-tank capacity\n(US gallons)") +
  ggtitle("Generalized Linear Model") +
  theme(plot.title = element_text(size = 14, color = "#fe8d6d"))

ggplot(cars93, aes(x = Price, y = Fuel.tank.capacity)) +
  geom_point(color = "grey60") +
  geom_smooth(method = "gam", formula = y ~ s(x), se = TRUE, color = "#7c6bea") +
  scale_x_continuous(
    name = "Price (USD)",
    breaks = c(20, 40, 60),
    labels = c("$20,000", "$40,000", "$60,000")
  ) +
  scale_y_continuous(name = "Fuel-tank capacity\n(US gallons)") +
  ggtitle("Generalized Additive Model") +
  theme(plot.title = element_text(size = 14, color = "#7c6bea"))