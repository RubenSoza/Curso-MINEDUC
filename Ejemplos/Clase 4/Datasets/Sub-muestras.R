####
#### Replica el archivo ene-stata.dta
####

# Nota.
# Todas las BBDD utilizadas pueden encontrarse en 
# https://www.ine.cl/estadisticas/laborales/ene

# Carga las librerías relevantes
library(haven)
library(dplyr)

# Carga y guarda 4 columnas de data-raw/ENE 2019 07 JJA.dta
haven::read_dta("data-raw/ENE 2019 07 JJA.dta") %>%
  dplyr::select(fact, activ, b1, cae_general) %>%
  haven::write_dta("data-raw/submuestra ENE 2019 07 JJA.dta")

# Carga y guarda 4 columnas de data-raw/ENE 2018 07 JJA.dta
haven::read_dta("data-raw/ENE 2018 07 JJA.dta") %>%
  dplyr::select(fact, activ, b1, cae_general) %>%
  haven::write_dta("data-raw/submuestra ENE 2018 07 JJA.dta")

# Carga y guarda 4 columnas de data-raw/ENE 2019 07 JJA.sav
haven::read_sav("data-raw/ENE 2019 07 JJA.sav") %>%
  dplyr::select(fact, activ, b1, cae_general) %>%
  haven::write_sav("data-raw/submuestra ENE 2019 07 JJA.sav")