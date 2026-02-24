library(readr)
library(dplyr)
library(stringr)

raw_path <- "data/victimas_violencia_raw.csv"
out_path <- "data/processed/victimas_violencia_rosario_2018_limpio.csv"

dir.create("data/processed", showWarnings = FALSE, recursive = TRUE)

df <- read_csv(raw_path, show_col_types = FALSE)

col_mes <- names(df)[1]
col_cant <- names(df)[2]

MESES <- c(
  "enero"=1, "febrero"=2, "marzo"=3, "abril"=4, "mayo"=5, "junio"=6,
  "julio"=7, "agosto"=8, "septiembre"=9, "setiembre"=9,
  "octubre"=10, "noviembre"=11, "diciembre"=12
)

parse_mes_anio <- function(x) {
  x <- str_trim(tolower(x))
  x <- str_replace_all(x, "á|à", "a")
  x <- str_replace_all(x, "é|è", "e")
  x <- str_replace_all(x, "í|ì", "i")
  x <- str_replace_all(x, "ó|ò", "o")
  x <- str_replace_all(x, "ú|ù", "u")

  m <- str_match(x, "^([a-zñ]+)\\s+(\\d{4})$")
  if (is.na(m[1,1])) return(NA_character_)

  mes_txt <- m[1,2]
  anio <- as.integer(m[1,3])
  mes <- unname(MESES[mes_txt])
  if (is.na(mes)) return(NA_character_)

  sprintf("%04d-%02d-01", anio, mes)
}

df2 <- df %>%
  rename(
    mes_anio = !!col_mes,
    cantidad = !!col_cant
  ) %>%
  mutate(
    mes_anio = str_trim(as.character(mes_anio)),
    cantidad = suppressWarnings(as.integer(cantidad))
  ) %>%
  filter(!is.na(mes_anio), mes_anio != "") %>%
  filter(!str_detect(str_to_lower(mes_anio), "^total")) %>%
  mutate(fecha = as.Date(parse_mes_anio(mes_anio))) %>%
  filter(!is.na(fecha), !is.na(cantidad)) %>%
  arrange(fecha) %>%
  select(fecha, mes_anio, cantidad)

if (nrow(df2) == 0) stop("No quedaron filas tras limpiar. Revisar formato del CSV.")

write_csv(df2, out_path)
message("✅ Guardado limpio en: ", out_path)
print(df2)