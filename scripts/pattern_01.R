library(ggplot2)
library(dplyr)
library(gganimate)

extrafont::loadfonts()

lines = tibble(
  x = seq(0, 19, by = .5),
  xend = x,
  y =  c(rep(c(5, 10), 19), 5),
  yend = rep(0, 39),
  speed = 3
)

dots = lines %>%
  select(x, y)

# Static Plot
ggplot() +
  # Lines
  geom_segment(data = lines,
               aes(x = x, y = y, 
                   xend = xend, yend = yend),
               color = "white") +
  # Points @ end of lines
  geom_point(data = dots,
             aes(x = x, y = y),
             color = "white") +
  labs(caption = "Ijeamaka Anyene | @ijeamaka_a") +
  # Make scale go +1 end of x axis if you dont want overlap (even number of spikes)
  # Make scale end at x axis, if you do want overlap (odd number of spikes)
  scale_x_continuous(limits = c(0, 19)) +
  # Make scale go into negatives to have center circle
  scale_y_continuous(limits = c(-5, 10)) +
  coord_polar() +
  theme(
    plot.background = element_rect(fill = "#75926f"),
    panel.background = element_rect(fill = "#75926f"),
    panel.grid = element_blank(),
    plot.caption = element_text(family = "Open Sans",
                                size = 6,
                                color = "white"),
    axis.title = element_blank(),
    axis.text = element_blank(),
    axis.ticks = element_blank()
  )

ggsave(
  "pattern_1.png",
  plot = last_plot(),
  device = "png", 
  path = here::here("outputs"), 
  width = 5, 
  height = 5
)




