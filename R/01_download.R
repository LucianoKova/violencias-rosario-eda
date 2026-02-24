url <- "https://datosabiertos.rosario.gob.ar/sites/default/files/uploaded_resources/victimas_de_nuevos_hechos_de_violencia_por_mes.csv"
raw_path <- "data/victimas_violencia_raw.csv"

dir.create("data", showWarnings = FALSE, recursive = TRUE)

download.file(url, destfile = raw_path, mode = "wb")
message("Descargado en: ", raw_path)