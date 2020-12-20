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


cols = tibble(
  x = 1,
  y = 6:1,
  type = LETTERS[1:6])

lines_mid = tibble(
  x = seq(-.5, 2.5, by = .1),
  xend = x,
  y = 6,
  yend = 10)

lines_bottom = lines_mid %>%
  mutate(y = 1,
         yend = 3)

lines_top = lines_mid %>%
  mutate(y = 15,
         yend = 21)

palette_color = c("#1b1626", "#2a2640",
                  "#734656", "#a64e46",
                  "#f27d52", "#f29544")
ggplot() +
  geom_col(data = cols,
           aes(x = x, y = y,
               fill = type,
               color = type),
           width = 3) +
  geom_segment(data = lines_mid,
               aes(x = x, y = y,
                   xend = xend, 
                   yend = yend),
               size = 1.5,
               color = "#a64e46") +
  geom_segment(data = lines_bottom,
               aes(x = x, y = y,
                   xend = xend, 
                   yend = yend),
               color = "#f29544") +
  geom_segment(data = lines_top,
               aes(x = x, y = y,
                   xend = xend,
                   yend = yend),
               size = 3,
               color = "#2a2640") +
  scale_fill_manual(values = palette_color) +
  scale_color_manual(values = palette_color) +
  labs(caption = "Ijeamaka Anyene | @ijeamaka_a") +
  coord_polar() +
  apply_pattern_theme("#c0b8b5",
                      "black")

ggsave(
  "pattern_28.png",
  plot = last_plot(),
  device = "png", 
  path = here::here("outputs"), 
  width = 4.9, 
  height = 5
)
