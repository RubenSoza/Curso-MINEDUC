#jercicios Practicos Vectores, Matrices y Listas.

## Vectores ----

# 1. Usar "seq()" para crear un vector de 10 números con espacio desde 0 a 12.
vec_num <- NULL

vec_num
# 2. Usar ":" para crear un vector de valores enteros entre el 31 y 40
vec_int <- NULL
vec_int

# 3. Usar "LETTERS" ,"[ ]" y "c()" para crear un vector con 9 letras comenzando desde la "C" y que además contenga la "Z"
vec_cha <- NULL
vec_cha

#4. Usar "letters" y "[ ]" para crear un vector factor con las primeras 10 letras minusculas.
vec_fac <- NULL
vec_fac


# 5. Combinar los vectores obtenidos en (3) y (4) usando "c()". No convertir a factor.
vec_let <-NULL
vec_let

# 6. combinar usando "c()" y "[ ]" los primero 4 elemento de "vec_num" 
# con los ultimos 4 elementos de "vec_int"
vec_ni <- NULL
vec_ni

# 7. Usar "rev()" para revertir el orden del vector obtenido en (4).
fac_vec <- NULL
fac_vec
# extra: sort()


# Matrices ----

# 1. Crear una matriz con 10 filas  y 4 columnas llenas de NA usando "matrix()"
mat.0<- NULL
mat.0

# 2. Asignar "vec_num" a la primera columna de "mat_1"
mat_1 <- mat.0 # no editar


# 3. Asignar "vec_int" a la ultima columna de mat_2
mat_2 <- mat_1 # no editar


# 4. Asignar "vec_cha" y "vec_fac" a las restantes columnas de "mat_2" para obtener "mat_3".
mat_3 <- mat_2 # no editar.



# 5. Selecionar la sexta fila de la matriz y guardar en "fila_6" como vector.
fila_6 <- mat_3[6,]

# 6. extraer el elemento asignado en la fila 5 y columna 3 como valor numerico.
valor_5.3 <- NULL  # solo nos indica la letra "e"

# buscamos la posicion de la letra "e"    # Hint: which()
valor_5.3 <- NULL
valor_5.3


# 7. Usando "cbind()" combinar "vec_num", "vec_int", "vec_cha", y "vec_fac" en "mat_4".
mat_4 <- NULL
mat_4

# 7.1. Reordenar las columnas de "mat_4" para que sea igual a "mat_3"
mat_ord <- NULL
mat_ord

# 8. Trasponer la matriz "mat_ord"y extraer solo las primeras 4 columnas y guardar en "mat_t"
mat_t <- NULL
mat_t

# 9. Usar rbind() y añadir mat_t a mat_ord 
mat_final <- NULL
mat_final

## Listas ---

# 1. Usar "list()" para crear una lista que contenga "vec_num" and "fila_6", asignandole los mismos nombres
list_1 <- NULL
list_1

# 2. Usando "$", extraer "fila_6" de "list_1" y asignar  "fila_6_2".
fila_6_2 <- NULL
fila_6_2

# 3. Crear otra lista que contenga "valor_5.3" and "mat_final".
list_2 <- NULL
list_2

# 4. Combinar "list_1" y "list_2" usando "c()"
list_3 <- NULL
list_3

# 5. Usar "unlist()" para convertir "list_3" en un vector
vector_3 <- NULL 
vector_3

# 6. Usar "as.list()"para convertir "vector_3" en una lista 
list_grande <- vector_3

# 7. Copiar "list_3" como "list_4"y usar "[[ ]]" para asignar "list_3" como el quinto elemento de "list_4", es decir,
# el quinto elemento es la misma lista.
list_4 <- vector_3
list_4[[5]]<-vector_3

View(list_4)  # nuevo comando


# 8. Seleccionar el tercer elemento del quinto elemento de "list_4" usando "[[ ]]" y "$"

element_5_3 <- NULL


## Data.frame ----

# 1. Usar "data.frame()" para combinar "vec_num" y "vec_int".
df_1 <- NULL
df_1

# 2. Usar "$" para extraer "vec_num" de "df_1", revertir su orden y guardar en "vec_num_2".
vec_num_2 <- NULL
vec_num_2

# 3. Usar "$" para añadir "vec_num_2" a "df_2" como una nueva columna de nombre "vector_numerico".
df_2 <- df_1 # no editar.


# 4. Combinar "df_2" dos veces usando "rbind()" y guardar.
df_3 <- NULL

# 5. Crear un nuevo data frame "df_4" "usando data.frame()" que contenga las siguientes columnas con nombre:
# "y"    : que contenga 20 numeros entre 45 y 87
# "x"    : 20 números entre 10 y 15 usando "runif()" (ver ayuda ?runif)  
# "color": crear un vector con 20 colores  usando el comando sample() (ver ayuda ?sample) y el vector chile

chile <- c("blanco","azul","rojo") # no editar
df_4 <- NULL
df_4

# 6. A "df_4" modificar la columna "color" y extraer 20 colores del vector "colors()" usando "sample()"
df_5 <- NULL
df_5

# 7. Usar "cbind()" para combinar "df_4" y "df_2"
df_6 <- NULL
df_6

# 8. Usar "data.frame()"para combinar "df_4" y "df_2"
df_7 <- NULL
df_7
# 9. Alguna diferencia entre "df_6" y "df_7"?


