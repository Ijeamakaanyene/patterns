library(ggplot2)
library(dplyr)

extrafont::loadfonts()

num_lines = 20

thin_lines = tibble(
  y = 1:num_lines,
  yend = 1:num_lines,
  x = 0,
  xend = num_lines
)

set.seed(100)
thick_lines = tibble(
  y = c(1:num_lines, 1:num_lines),
  yend = c(1:num_lines, 1:num_lines),
  x = runif(num_lines*2, min = 0, max = 15),
  xend = x + runif(num_lines*2, min = 1, max = 5)
)

ggplot() +
  geom_segment(data = thin_lines,
               aes(x = x, y = y,
                   xend = xend, yend = yend),
               color = "#aaaaaa",
               size = 0.5) +
  geom_segment(data = thick_lines,
               aes(x = x, y = y,
                   xend = xend, yend = yend),
               color = "#0c0507",
               size = 1.5,
               lineend = "round") +
  scale_x_continuous(limits = c(0, 20)) +
  labs(caption = "Ijeamaka Anyene | @ijeamaka_a") +
  coord_polar() +
  theme(
    plot.background = element_rect(fill = "white"),
    panel.background = element_rect(fill = "white"),
    plot.caption = element_text(family = "Open Sans",
                                size = 6,
                                color = "black"),
    panel.grid = element_blank(),
    legend.position = "none",
    axis.title = element_blank(),
    axis.text = element_blank(),
    axis.ticks = element_blank()
  )


ggsave(
  "pattern_8.png",
  plot = last_plot(),
  device = "png", 
  path = here::here("outputs"), 
  width = 5, 
  height = 5
)
