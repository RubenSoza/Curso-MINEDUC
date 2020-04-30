# Ejemplos Clase 1#

# Ejemplo 1 #

# Calcular la tangente de la raiz del coseno de 1 #
x <- 1
# Opción 1
tan(sqrt(cos(1)))

# Opción 2
x %>% 
  cos() %>% 
  sqrt() %>% 
  tan()

# Ejemplo 2 #

# Cargue la base de datos 
setwd('G:/Mi unidad/Universidad/Cursos/Curso BICEVIDA')

library(readxl)
encuesta <- read_excel("Datasets/encuesta.xlsx")
summary(encuesta$P156)

