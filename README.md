# 📊 Análisis Exploratorio de Datos  
## Víctimas de Nuevos Hechos de Violencia - Rosario (2018)

### 🎯 Objetivo

Desarrollar un pipeline completo de análisis de datos utilizando R para estudiar la evolución mensual de víctimas de nuevos hechos de violencia en Rosario durante 2018.

---

## 🔎 Metodología

El proyecto implementa un flujo ETL completo:

1. **Extracción**  
   - Descarga automática del dataset oficial desde el portal de datos abiertos.

2. **Transformación**
   - Limpieza de columnas
   - Normalización de texto (acentos y formato)
   - Eliminación de filas agregadas (TOTAL)
   - Conversión a formato fecha
   - Ordenamiento temporal

3. **Análisis**
   - Identificación del mes con mayor cantidad de víctimas
   - Generación de serie temporal

4. **Visualización**
   - Gráfico de evolución mensual
   - Exportación en formato PNG

---

## 📈 Resultados

El mes con mayor cantidad de víctimas fue:

> **Octubre 2018 — 223 casos**

---

## 🛠 Tecnologías utilizadas

- R
- dplyr
- readr
- stringr
- ggplot2

---

## 📁 Estructura del proyecto
