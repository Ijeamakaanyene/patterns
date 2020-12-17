library(ggplot2)
library(dplyr)

extrafont::loadfonts()

center_circle = tibble(
  x = seq(0, 19, by = .5),
  xend = x,
  y = rep(0, 39),
  yend = rep(3, 39)
)

outer_circle = center_circle %>%
  mutate(y = yend,
         yend = yend + 6)

ggplot() +
  geom_segment(data = center_circle,
               aes(x = x, xend = xend,
                   y = y, yend = yend),
               size = 0.5,
               color = "white") +
  geom_segment(data = outer_circle,
               aes(x = x, xend = xend,
                   y = y, yend = yend),
               size = 2,
               color = "white") +
  labs(caption = "Ijeamaka Anyene | @ijeamaka_a") +
  scale_y_continuous(limits = c(-2, 10)) +
  coord_polar() +
  theme(
    plot.background = element_rect(fill = "#8a484a"),
    panel.background = element_rect(fill = "#8a484a"),
    plot.caption = element_text(family = "Open Sans",
                                size = 6,
                                color = "white"),
    panel.grid = element_blank(),
    axis.title = element_blank(),
    axis.text = element_blank(),
    axis.ticks = element_blank()
  )

ggsave(
  "pattern_3.png",
  plot = last_plot(),
  device = "png", 
  path = here::here("outputs"), 
  width = 5, 
  height = 5
)
