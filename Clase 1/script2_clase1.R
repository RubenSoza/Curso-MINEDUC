#Actividad2
## carga de los datos NO MODIFICAR 
Encuesta <- read_excel(".../Encuesta.xlsx")
View(Encuesta)

## otra opcion

library(readxl)
Encuesta <-read_excel(file.choose())
Encuesta

names(Encuesta)
Encuesta$P3
attach(Encuesta) # para usar el nombre directamente de las variables y no llamarlas como BASE$variable


#detach(Encuensta) # Vuelve a unirla y se tiene que usar BASE$variable

### ---- ---
# 1. Dejar en la variable "Región" solo los nombres de cada región. (P3)


# 2. Podemos hacerlo encadenando objetos



# 3. Obtener un nuevo objeto que solo contenga Hombres de Valparaíso (P3 y P9)
Encuesta2 <- NULL

#extra edad promedio


# 4. Calcular el promedio de edad entre los hombres de valparaíso que creen 
#    que seran víctimas de un delito ( P8 y P64)


# otra forma


# 5. Lo mismo anterior pero que NO crean que van a ser víctimas de un delito.



# 6. con aggregate obtener los promedio de edad por cada uno de los tipos de respuesta de la pregunta P64



# 7. Cuantos hombres de valparaíso estan casados


# HINT:
#table(x) hace una tabla de frecuencia simple
# prop.table(x) hace la tabla de frecuencias relativas

#otra opcion

# 8. Cual es la proporción de hombres solteros

# 9. Cuantas mujeres de coquimbo gastaron dinero en seguridad (P154)



# 10. Tabla resumen que indique el procentaje de victimización regional, calculado como el número 
#de personas que han sido víctima de algún delito dividido por el total de personas encuestadas 
#en cada región



# 11. Edad promedio por región .... Hint: usar aggregate()



# 12. Unir las tablas 2 y 3 usando merge()



