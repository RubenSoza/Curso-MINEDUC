# Ejemplo 1#

url  <- 'https://raw.githubusercontent.com/rstudio/EDAWR/master/data-raw/storms.csv'
download.file(url, "storms.csv", mode = "wb")

storms <- read.csv("G:/Mi unidad/Universidad/Cursos/Computación Estadística con R/Clase1/Scripts/data/storms.csv")
library(tidyverse)
storms %>% # ctrl + shift + m
  filter(pressure >= 1010, wind < 50) %>% 
  summarise(promedio = mean(wind), sd = sd(wind))

# Promedio y desviación estándar
datos_wind <- storms %>% 
  filter(pressure >= 1010, wind < 50) %>% 
  summarise(promedio = mean(wind), sd = sd(wind))

# Cambio de unidades
storms <- storms %>% 
  mutate(pressure2 = pressure / 1000)

# Ordenar una tabla de forma descendente sin considerar una columna
storms %>% 
  select(-pressure) %>%
  arrange(desc(date))


# Ejemplo 2
numeros  <- read_excel('Clase 1/data/numeros.xlsx')
numeros %>% 
  group_by(region) %>% 
  summarise(min = min(valor), max = max(valor))

numeros %>% 
  group_by(region) %>% 
  summarise(promedio = mean(valor))

# Ejemplo 3
library(tidyverse)
starwars %>%
  mutate(
    type = case_when(
      height > 200 | mass > 200 ~ "large",
      species == "Droid"        ~ "robot",
      TRUE                      ~ "other"
    )
  )

# Ejemplo 4 #

library(tidyverse)

# CTRL + SHIFT + R
data1 <- tibble(
  nombre = c("Rubén", "Teresa", "Axel", "Pamela"),
  apellido = c("Fuentes", "Martinez", "Baeza", "Gonzalez"),
  valor = c(1, 2, NA, 4)
)
data1

data2 <- tibble(
  nombre = c("Rubén", "Teresa", "Axel", "Pamela", "Pamela"),
  lastname = c("Soza", "Martines", "Baeza", "Gonzalez", "Jimenez"),
  valor2 = c(100, 200, 300, 400, 500)
)

data1
data2

# full_join ---------------------------------------------------------------
# Definicion: júntame todo lo que parea
# (a mi me gusta match)

# A lo inocente sin especificar el "by"
full_join(data1, data2)

full_join(data1, data2, by = c("nombre", "apellido" = "lastname"))


# inner_join --------------------------------------------------------------
# Definicion: déjame solo lo que parea
# (a mi me gusta match)
inner_join(data1, data2, by = c("nombre", "apellido" = "lastname"))


# left_join ---------------------------------------------------------------
# Definicion: deja fija la de la izquierda (la principal)
# y pega lo que exista en la segunda
datat <- left_join(data1, data2, by = c("nombre", "apellido" = "lastname"))


# Ejemplo 5 #

data("table4a")
table4a

table4a %>% 
  mutate(promedio = (`1999` + `2000`)/2)

table4a %>% 
  gather(anios, casos, `1999`, `2000`)

# el menos se interpreta, como TODO menos, lo que tenga menos
table4a %>% 
  gather(anios, casos, -country)

table4a %>% 
  gather(anios, casos, -country) %>% 
  group_by(country) %>% 
  summarise(promedio = mean(casos))

data1 %>% left_join(data2, by = "nombre")

table4a %>% 
  gather(anios, casos, -country) %>% 
  group_by(country) %>% 
  summarise(promedio = mean(casos)) %>% 
  left_join(table4a)

table4a <- table4a %>% 
  mutate(
    `2001` = c(123,3453,234),
    `2002` = c(78678,3423,456)
  )

table4a

table4a %>% 
  mutate(promedio = (`1999` + `2000` + `2001` + `2002`)/4)

table4a %>% 
  gather(anios, casos, `1999`, `2000`)

# el menos se interpreta, como TODO menos, lo que tenga menos
table4a %>% 
  gather(anios, casos, -country)

table4a %>% 
  gather(anios, casos, -country) %>% 
  group_by(country) %>% 
  summarise(promedio = mean(casos))

# mutate(storm, variable = 3)
# storm %>% mutate(variable = 3)

data1 %>% left_join(data2, by = "nombre")

table4a %>% 
  gather(anios, casos, -country) %>% 
  group_by(country) %>% 
  summarise(promedio = mean(casos)) %>% 
  left_join(table4a)

