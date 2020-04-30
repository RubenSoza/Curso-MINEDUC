#Actividad2
## carga de los datos NO MODIFICAR 
Encuesta <-read_excel(file.choose())

attach(Encuesta) # para usar el nombre directamente de las variablesy no llamarlas como BASE$variable

#detach(Encuensta) # Vuelve a unirla y se tiene que usar BASE$variable


#Equivalente a buscar en excel- busca un objeto, vertical, en columna. 
#El retorno es la posición de los objetos

gsub()
#gsub reemplaza
#entrega el objeto completo reemplazado
#Equivalente a buscar en excel- busca un objeto, vertical, en columna. 
#El retorno es la posición de los objetos

substr()
#substr substrae de un objeto un carcter entre la posición inicial y final

paste()
#paste concatena textopara unir dos objetos que corresponden a dos vectores de texto y tengo que agregar que tipo de separación poner
#Por defecto toma la separación como espacio

merge()
#merge funde dos archivos, los concatena, pero pueden ser bases de datos. X e Y son los archivos que voy a fundir
#by.x y by.y es lo que me va a permitir concatenar las bases (si es el mismo nombre simplemente pongo by) cuando los datos no son iguales en las dos bases
#para esa variable puedo indicarle que considerar. 

aggregate()
#aggregate agrega una base de datos. su comportamiento es en fórmula. Para R una formula es como una variable 
#puede ser expresada en términos de otra x dado Y (cola de chancho da notación de fórmula) Si x es una variable 
#númerica e Y una de categorías voy a encontrar una función de x para cada categoría de Y Entrega un nuevo objeto que es un data frame
# El aggregate puede entregar algo parecido a una tabla dinámica

apply()
#recibe un objeto principlamente de la misma naturaleza, debería ser una matriz, y quiero que aplica la misma fórmula a todas las filas o a todas las columnas
#columna (2)
#filas(1)

subset()
#realiza filtro (como el corchete). Le entrego un objeto y le digo que sustraer. Le reduce la dimensión del objeto a los que cumplen la condición. Retorna el mismo objeto filtrado


### ----
# 1. Dejar en la variable "Región" solo los nombres de cada región.
P3a = gsub("Región del ", "", P3)
P3a
P3b = gsub ("Región de ", "", P3a)
P3b
P3c = gsub ("Región", "", P3b)
P3c

# 2. Podemos hacerlo encadenando objetos
P3d = gsub("Región ", "",
           gsub("Región de ", "",
                gsub("Región del ", "", P3) ) )
P3d



# versión corta
P3_corta = gsub('Región del |Región de |Región ',"",P3)


# 3. Obtener un nuevo objeto que solo contenga Hombres de Valparaíso
Encuesta2 = subset(Encuesta, P3c == " Valparaíso" & P9 == "Hombre")
Encuesta2
head(Encuesta2)
dim(Encuesta2)

# 4. Calcular el promedio de edad entre los hombres de valparaíso
# que creen que seran víctimas de un delito (P64)
P64
P64a = Encuesta2$P8[Encuesta2$P64 == "Si"]
mean(P64a)

# otra forma
mean(Encuesta2$P8[Encuesta2$P64 == "Si"])
P64a

# 5. Lo mismo anterior pero que NO crean que van a ser víctimas de un delito.
mean(Encuesta2$P8[Encuesta2$P64 != "Si"]) # responden distinto de si
mean(Encuesta2$P8[Encuesta2$P64 == "No"]) # responden no


# 6. con aggregate obtener los promedio de edad por cada uno de los tipos de respuesta de la pregunta P64
aggregate(Encuesta2$P8 ~ Encuesta2$P64 , FUN = mean)

# 7. Cuantos hombres de valparaíso estan casados
logico = Encuesta2$P13 == "Casado/a"
sum(logico)

# HINT:
#table(x) hace una tabla de frecuencia simple
# prop.table(x) hace la tabla de frecuencias relativas

#otra opcion
table(Encuesta2$P13)

# 8. Cual es la proporción de hombres solteros
prop.table(table(Encuesta2$P13))

# 9. Cuantas mujeres de coquimbo gastaron dinero en seguridad (P154)
Mujeres_Coquimbo = subset(Encuesta, P3c == " Coquimbo" & P9 == "Mujer")
Mujeres_Coquimbo
dim(Mujeres_Coquimbo)
Mujeres_CoquimboP154 = gsub("No gastó dinero en medidas de seguridad", "NO",
                            gsub("No sabe", "NO",
                                 gsub("No responde", "NO", Mujeres_Coquimbo$P154)))

logico2 = Mujeres_CoquimboP154 != "NO"
sum(logico2)

# otra opcion
total <- NULL
E2=Encuesta$P154[Encuesta$P3=="Región de Coquimbo" & Encuesta$P9=="Mujer"]
total = length(E2[-grep("No ", E2)])
total

# 10. Tabla resumen que indique el procentaje de victimización regional, calculado como el número 
#de personas que han sido víctima de algún delito dividido por el total de personas encuestadas 
#en cada región
tabla2 <- NULL

table(P94)
table(P3, P94)
prop.table(table(P3, P94))
(prop.table(table(P3, P94), 1)*100) # Del total de la región metropolitana cuántos dijeron Sí
prop.table(table(P3, P94), 2)*100 # Del total de los que dijeron que sí, cuántos son de la región Metropolitana
tabla = data.frame(prop.table(table(Encuesta$P3, Encuesta$P94), 1)*100)
head(tabla)
tabla2 = subset(tabla, Var2 == "Sí")
head(tabla2)

# 11. Edad promedio por región .... Hint: usar aggregate()
tabla3 <- NULL
tabla3 = aggregate(Encuesta$P8 ~ Encuesta$P3, FUN = mean)
tabla3

# 12. Unir las tablas 2 y 3 usando merge()
tabla4 = merge(tabla2, tabla3, by.x = "Var1", by.y = "Encuesta$P3")
tabla4
