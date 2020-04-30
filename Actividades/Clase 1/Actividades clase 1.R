# Actividades Clase 1 #

# Actividad 1 #
impares <- seq(1, by = 2, length.out = 1000)
subset <- impares[c(1,10,100,1000)]
sum(sqrt(subset))

subset %>%
  sqrt() %>% 
  sum() %>% 
  abs()


# Actividad 2 #
library(readxl)
library(psych)

# la url de los datos
url <- "http://datos.gob.cl/dataset/c2969d8a-df82-4a6c-a1f8-e5eba36af6cf/resource/cbd329c6-9fe6-4dc1-91e3-a99689fd0254/download/pcma20181017oficio-47702013.xlsx"
url

# descargamos
download.file(url, "archivo.xlsx", mode = "wb")


# leemos
datos <- read_excel("archivo.xlsx", sheet = "PCMA", skip = 10)

datos

glimpse(datos) # ¿Cuatos registros y filas tiene la tabla?
describeBy(datos$NORTE, datos$ENTIDAD)

# Actividad 3 #

library(readxl)
library(tidyverse)
Encuesta <- read_excel('Datasets/encuesta.xlsx')
Encuesta %>% 
  select(P3,P8,P9,P154,P156) %>%
  filter(P9 == "Hombre", P3 == "Región de Valparaíso") %>%
  arrange(P8) %>%
  mutate(PRSC = P156/max(P156)) %>%
  group_by(P154) %>%
  summarise(mean(PRSC))