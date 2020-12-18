library(ggplot2)
library(dplyr)

extrafont::loadfonts()


rings = tibble(
  x = 1,
  xend = 5,
  y = c(2, 5),
  yend = c(2, 5)
)

points = tibble(
  x = c(2, 4, 1.5, 3.5),
  y = c(2, 2, 5, 5)
)

ggplot() +
  geom_segment(data = rings,
               aes(x = x, xend = xend, 
                   y = y, yend = yend),
               color = "white") +
  geom_point(aes(x = 3, y = 0),
             size = 4,
             color = "#c74a00") +
  geom_point(data = points,
             aes(x = x, y = y),
             size = 3,
             color = "#f39200") + 
  labs(caption = "Ijeamaka Anyene | @ijeamaka_a") +
  scale_y_continuous(limits = c(0, 5)) +
  coord_polar() +
  theme(
    panel.grid = element_blank(),
    panel.background = element_rect(fill = "#2e2137"),
    plot.background = element_rect(fill = "#2e2137"),
    plot.caption = element_text(family = "Open Sans",
                                size = 6,
                                color = "white"),
    axis.title = element_blank(),
    axis.text = element_blank(),
    axis.ticks = element_blank()
  )

ggsave(
  "pattern_11.png",
  plot = last_plot(),
  device = "png", 
  path = here::here("outputs"), 
  width = 5, 
  height = 5
)
