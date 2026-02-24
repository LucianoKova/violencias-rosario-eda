library(readr)
library(dplyr)
library(ggplot2)

in_path <- "data/processed/victimas_violencia_rosario_2018_limpio.csv"
df <- read_csv(in_path, show_col_types = FALSE)

p <- ggplot(df, aes(x = fecha, y = cantidad)) +
  geom_line() +
  geom_point() +
  labs(
    title = "Víctimas de nuevos hechos de violencia por mes (Rosario, 2018)",
    x = "Mes",
    y = "Cantidad"
  ) +
  theme_minimal()

dir.create("figures", showWarnings = FALSE, recursive = TRUE)
ggsave("figures/serie_mensual.png", plot = p, width = 9, height = 5, dpi = 150)

print(p)

media <- mean(df$cantidad)
sdv <- sd(df$cantidad)

picos <- df %>% filter(cantidad > media + sdv)
message("Meses pico:")
print(picos)