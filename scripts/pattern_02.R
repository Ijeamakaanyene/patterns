library(ggplot2)
library(dplyr)
#library(gganimate)

extrafont::loadfonts()

num_lines = 10

circle = tibble(
  x  = rep(0, 10, 
           length.out = num_lines),
  xend = seq(from = 5,
             to = 10,
             length.out = num_lines ),
  y = 1:num_lines,
  yend = 1:num_lines 
)

ggplot(data = circle) +
  geom_segment(aes(x = x, y = y,
                   xend = xend, yend = yend),
               color = "white") +
  scale_x_continuous(limits = c(0, 12)) +
  scale_y_continuous(limits = c(-3, num_lines)) +
  labs(caption = "Ijeamaka Anyene | @ijeamaka_a") +
  coord_polar() +
  theme(
    plot.background = element_rect(fill = "#14232a"),
    panel.background = element_rect(fill = "#14232a"),
    plot.caption = element_text(family = "Open Sans",
                                size = 6,
                                color = "white"),
    panel.grid = element_blank(),
    axis.title = element_blank(),
    axis.text = element_blank(),
    axis.ticks = element_blank()
  )

ggsave(
  "pattern_2.png",
  plot = last_plot(),
  device = "png", 
  path = here::here("outputs"), 
  width = 5, 
  height = 5
)

num_lines = 10

# Right half of circle 
part1 = tibble(
  x = rep(0, 
          length.out = num_lines),
  xend = rep(6, 
             length.out = num_lines),
  y = 1:num_lines,
  yend = 1:num_lines
)

# Left half of circle
part2 = tibble(
  x = seq(12, 7, 
          length.out = num_lines),
  xend = rep(12, num_lines),
  y = 1:num_lines,
  yend = 1:num_lines
)

bind_rows(part1, part2) %>%
  ggplot(.) +
  geom_segment(aes(x = x, y = y,
                   xend = xend, yend = yend),
               color = "white") +
  scale_x_continuous(limits = c(0, 12)) +
  scale_y_continuous(limits = c(-2, 10)) +
  labs(caption = "Ijeamaka Anyene | @ijeamaka_a") +
  coord_polar() +
  theme(
    plot.background = element_rect(fill = "#14232a"),
    panel.background = element_rect(fill = "#14232a"),
    panel.grid = element_blank(),
    plot.caption = element_text(family = "Open Sans",
                                size = 6,
                                color = "white"),
    axis.title = element_blank(),
    axis.text = element_blank(),
    axis.ticks = element_blank()
  )

ggsave(
  "pattern_2_v2.png",
  plot = last_plot(),
  device = "png", 
  path = here::here("outputs"), 
  width = 5, 
  height = 5
)







