library(dplyr)
library(ggplot2)
library(ggforce)


apply_pattern_theme = function(bg_hex, caption_hex){
  theme(
    plot.background = element_rect(fill = bg_hex),
    panel.background = element_rect(fill = bg_hex),
    panel.grid = element_blank(),
    plot.caption = element_text(family = "Open Sans",
                                size = 6,
                                color = caption_hex),
    legend.position = "none",
    axis.title = element_blank(),
    axis.text = element_blank(),
    axis.ticks = element_blank()
  )
}

num_lines = 100

circle = tibble(
  len = seq(0, 2*pi, length.out = num_lines),
  x = sin(len),
  y = cos(len))

circle_top = circle %>%
  filter(y >= 0)

circle_bottom = circle %>%
  filter(y < 0) %>%
  mutate(x = x + 1)

lines_top = circle %>%
  filter(y >= 0.055) %>%
  mutate(yend = y,
         y = 0.055,
         x = x + 1,
         xend = x)

lines_bottom = circle %>%
  filter(y <= -0.03) %>%
  mutate(yend = y,
         y = -.03,
         xend = x)

ggplot() +
  geom_segment(data = lines_top,
               aes(x = x, y = y,
                   xend = xend, yend = yend),
               size = 0.7,
               lineend = "round",
               color = "white") +
  geom_segment(data = lines_bottom,
               aes(x = x, y = y,
                   xend = xend, yend = yend),
               size = 0.7,
               lineend = "round",
               color = "white") +
  geom_shape(data = circle_top,
             aes(x, y),
             fill = "#cbac9a") +
  geom_shape(data = circle_bottom,
             aes(x, y),
             fill = "#cbac9a") +
  coord_fixed() +
  labs(caption = "Ijeamaka Anyene | @ijeamaka_a") +
  apply_pattern_theme("#3c5551", "white")

ggsave(
  "pattern_22.png",
  plot = last_plot(),
  device = "png", 
  path = here::here("outputs"), 
  width = 7, 
  height = 5
)
