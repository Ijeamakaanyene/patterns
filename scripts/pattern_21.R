library(ggplot2)
library(dplyr)
library(ggforce)

extrafont::loadfonts()

circle = tibble(
  len = seq(0, 2*pi, length.out = 61),
  x = sin(len),
  y = cos(len),
  type = 1:61
)

left = circle %>%
  filter(x < 0, y < 1, y > -1) %>%
  mutate(xend = -0.02)

right = circle %>%
  filter(x > 0, y < 1, y > -1) %>%
  mutate(xend = 0.02)

ggplot() +
  geom_segment(data = left,
               aes(x = x, xend = xend, 
                   y = y, yend = y),
               lineend = "round",
               color = "white",
               size = 1.1) +
  geom_segment(data = right,
               aes(x = x, xend = xend,
                   y = y, yend = y),
               lineend = "round",
               color = "white",
               size = 1.1) +
  scale_x_continuous(limits = c(-1.5, 1.5)) +
  scale_y_continuous(limits = c(-1.5, 1.5)) +
  coord_fixed() +
  labs(caption = "Ijeamaka Anyene | @ijeamaka_a") +
  theme(
    plot.background = element_rect(fill = "#2a5c4d"),
    panel.background = element_rect(fill = "#2a5c4d"),
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
  "pattern_21.png",
  plot = last_plot(),
  device = "png", 
  path = here::here("outputs"), 
  width = 4.9, 
  height = 5
)
