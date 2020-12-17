library(ggplot2)
library(dplyr)

extrafont::loadfonts()

area = tibble(
  x = c(1, 2, 1.5),
  y = c(1, .5, .25),
  type = LETTERS[1:3]
)

ggplot() +
  geom_col(data = area,
           aes(x = x, y = y,
               fill = type),
           alpha = .75,
           width = 2) + 
  scale_x_continuous(limits = c(0, 3)) + 
  scale_fill_manual(values = c("#1c2253", "#c48831", "#013237")) +
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
  "pattern_9.png",
  plot = last_plot(),
  device = "png", 
  path = here::here("outputs"), 
  width = 5, 
  height = 5
)
