library(ggplot2)
library(dplyr)

extrafont::loadfonts()

increment = .05

circle_1 = tibble(
  x = seq(from = 0, to = 5, by = increment),
  xend = seq(from = 0, to = 5, by = increment),
  y = 0, 
  yend = 1.5,
  type = LETTERS[1]
)


circle_2 = tibble(
  x = seq(from = 0, to = 5, by = increment),
  xend = seq(from = 0, to = 5, by = increment),
  y = 1.5,
  yend = 3,
  type = LETTERS[2]
)

circle_3 = tibble(
  x = seq(from = 0, to = 5, by = increment),
  xend = seq(from = 0, to = 5, by = increment),
  y = 3,
  yend = 4.5,
  type = LETTERS[3]
)

palette_values = c("#ba6763", "#8d667e", "#39355c")

bind_rows(circle_1, circle_2, circle_3) %>%
  ggplot(.) + 
  geom_segment(aes(x = x, y = y,
                   xend = xend, yend = yend,
                   color = type)) +
  scale_color_manual(values = palette_values) +
  labs(caption = "Ijeamaka Anyene | @ijeamaka_a") +
  coord_polar() +
  theme(
    plot.background = element_rect(fill = "#fffcef"),
    panel.background = element_rect(fill = "#fffcef"),
    panel.grid = element_blank(),
    plot.caption = element_text(family = "Open Sans",
                                size = 6,
                                color = "black"),
    legend.position = "none",
    axis.title = element_blank(),
    axis.text = element_blank(),
    axis.ticks = element_blank())

ggsave(
  "pattern_10.png",
  plot = last_plot(),
  device = "png", 
  path = here::here("outputs"), 
  width = 5, 
  height = 5
)
