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

num_lines = 61

circle = tibble(
  len = seq(0, 2*pi, length.out = num_lines),
  x = sin(len),
  y = cos(len))

vertical_up = circle %>%
  filter(y > 0) %>%
  mutate(yend = 1.25,
         xend = x)

vertical_down = circle %>%
  filter(y < 0) %>%
  mutate(yend = -1.25,
         xend = x)

horizontal_left = circle %>%
  filter(x < 0) %>%
  mutate(xend = 0,
         yend = y)

horizontal_right = circle %>%
  filter(x > 0) %>%
  mutate(xend = 0,
         yend = y)

addtl_lines = tibble(
  
)



ggplot() +
  geom_segment(data = vertical_up,
               aes(x = x, y = y,
                   xend = xend, 
                   yend = yend),
               color = "white",
               linejoin = "round",
               size = 1.25) +
  geom_segment(data = vertical_down,
               aes(x = x, y = y,
                   xend = xend, 
                   yend = yend),
               color = "white",
               linejoin = "round",
               lineend = "round",
               size = 1) +
  geom_segment(data = horizontal_left,
               aes(x = x, y = y,
                   xend = xend, 
                   yend = yend),
               color = "white",
               linejoin = "round",
               lineend = "round",
               size = 1) +
  geom_segment(data = horizontal_right,
               aes(x = x, y = y,
                   xend = xend, 
                   yend = yend),
               color = "white",
               linejoin = "round",
               lineend = "round",
               size = 1) +
  coord_flip() +
  labs(caption = "Ijeamaka Anyene | @ijeamaka_a") +
  apply_pattern_theme("#902018", "white")


ggsave(
  "pattern_24.png",
  plot = last_plot(),
  device = "png", 
  path = here::here("outputs"), 
  width = 5.7, 
  height = 5
)
