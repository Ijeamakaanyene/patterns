library(ggplot2)
library(dplyr)
library(ggforce)

extrafont::loadfonts()


dots = expand.grid(x = seq(1, 10, by = .2), y = c(1:10))

dots = dots %>%
  mutate(type = sample(c("Y", "N"), 460, replace = TRUE)) %>%
  filter(type == "Y")

outline = tibble(
  x = c(.9, .9, .9, 10.1),
  xend = c(10.1, 10.1, .9, 10.1),
  y = c(.55, 11, .55, .55),
  yend = c(.55, 11, 11, 11)
)

ggplot() +
  geom_point(data = dots, 
             aes(x = x, y = y),
             color = "#ffffff",
             alpha = 0.2,
             size = 3) +
  geom_point(data = dots, 
             aes(x = x, y = y),
             color = "#ffffff") +
  geom_segment(data = outline,
               aes(x = x, xend = xend,
                   y = y, yend = yend),
               color = "#ffffff") +
  geom_segment(data = outline,
               aes(x = x, xend = xend,
                   y = y, yend = yend),
               alpha = 0.2,
               size = 1.4,
               color = "#ffffff") +
  scale_y_continuous(limits = c(-2, 11)) +
  scale_x_continuous(limits = c(0.5, 10.5)) +
  coord_polar() +
  labs(caption = "Ijeamaka Anyene | @ijeamaka_a") +
  theme(
    plot.background = element_rect(fill = "#040404"),
    panel.background = element_rect(fill = "#040404"),
    plot.caption = element_text(family = "Open Sans",
                                size = 6,
                                color = "white"),
    panel.grid = element_blank(),
    legend.position = "none",
    axis.title = element_blank(),
    axis.text = element_blank(),
    axis.ticks = element_blank()
  )




ggsave(
  "pattern_4.png",
  plot = last_plot(),
  device = "png", 
  path = here::here("outputs"), 
  width = 4.9, 
  height = 5
)
