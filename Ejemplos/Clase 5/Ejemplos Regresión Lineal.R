# Cargamos base de datos

library(dslabs)
data("gapminder", package = "dslabs")
head(gapminder)

# Trabajaremos con los datos de Chile!
library(tidyverse)
Chile <- gapminder %>% 
  filter(country == "Chile") %>% 
  select(-country, -continent, -region) %>% 
  drop_na()

###############################
### Regresión Lineal Simple ###
###############################

# Tratemos de explicar la esperanza de vida en Chile

library(GGally)
Chile %>% 
  ggpairs()

# Escogemos una variable y realicemos nuestra regresión

modelo1 <- lm(life_expectancy ~ year, data = Chile)

# Analicemos los coeficientes
summary(modelo1)
confint(modelo1)

# Modelo sin intercepto
modelo_sin <- lm(life_expectancy ~ year - 1, data = Chile )
summary(modelo_sin)

# Veamos la recta ajustada
library(ggiraph);library(ggiraphExtra)
ggPredict(modelo1, interactive = TRUE, se = TRUE)
ggPredict(modelo_sin, interactive = TRUE, se = TRUE)

# Modelo logaritmo
Chile2 <- Chile %>% 
  mutate(life_expectancy = log(life_expectancy))

modelo_log <- lm(life_expectancy ~ year, data = Chile2)
summary(modelo_log)

# Gráfico
ggPredict(modelo_log, interactive = TRUE, se = TRUE)

# Predicción
predict(modelo_log, newdata = tibble("year" = c(1800,1900,2019)), interval = "predict")

# ¿Qué pasa si queremos predecir en los años 2017-2020?
predict(modelo1, newdata = tibble(year = 2017:2020), interval = "predict")

###############################
## Regresión Lineal Multiple ##
###############################

modelo2 <- lm(life_expectancy ~ year + population, data = Chile)

# Coeficientes del modelo2
summary(modelo2)
confint(modelo2)

# Predecir una nueva observación
predict(modelo2, newdata = tibble(year = 2018, population = 19000000), interval = "predict")

modelo_log2 <- lm(life_expectancy ~ year + population, data = Chile2)
summary(modelo_log2)

predict(modelo_log2, newdata = tibble(year = 2018, population = 19000000), 
        interval = "predict")

# Modelos anidados
modelo3 <- lm(life_expectancy ~ year + population + gdp, data = Chile)
anova(modelo2,modelo3)


# Ejemplo variable multicategórica

continentes <- gapminder %>% 
  filter(continent %in% c("Europe", "Americas", "Africa")) %>% 
  drop_na()

head(continentes)

# Cambio de escala
continentes2 <- continentes %>% 
  mutate(life_expectancy = log(life_expectancy))

# Regresión
modelo_cont <- lm(life_expectancy ~ year + population + factor(continent), 
                  data = continentes2)

summary(modelo_cont)

# Selección de variables

modelo4 <- step(lm(life_expectancy ~ 1, data = Chile2), 
     life_expectancy ~ year + infant_mortality + fertility + population + gdp, 
     direction = "both", trace = FALSE)

library(lmtest)
summary(modelo4)

# Comparemos este modelo con el que no posee mortalidad infantil
modelo5 <- lm(life_expectancy ~ gdp + population, data = Chile2)
summary(modelo5)

modelo6 <- lm(life_expectancy ~ gdp + population + fertility, data = Chile2)
summary(modelo6)

# Comparación de modelo usando AIC y BIC
AIC(modelo4,modelo5,modelo6)
BIC(modelo4,modelo5,modelo6)

# Comparacion de modelo usando r2-ajustado
c(summary(modelo4)$adj.r.squared,
  summary(modelo5)$adj.r.squared, 
  summary(modelo6)$adj.r.squared )

#########################
# Escogemos el modelo 4 #
#########################

# Bondad de ajuste
finalmodel <- modelo4

# Normalidad de los errores
data <- tibble("fit" = finalmodel$fitted.values, "res" = finalmodel$residuals)
p1 <- ggplot(data, aes(sample = res)) + stat_qq() + stat_qq_line() 
p1
shapiro.test(data$res)

# Homocedasticidad de la varianza
p1 <- ggplot(data) + geom_point(aes(x = fit, y = res))
p1

# Independencia de los errores
library(lmtest)
dwtest(life_expectancy ~ gdp + population + infant_mortality, data = Chile)

# Identificación de Outliers
library(ggrepel)
data <- data %>% mutate("res_stud" = rstudent(finalmodel), labels = seq(1,nrow(data))) 
ggplot(data, aes(x = fit, y = res_stud, label = labels)) + geom_point() +
  geom_hline(yintercept = qnorm(0.025)) + geom_hline(yintercept = qnorm(0.975)) +
  geom_text(hjust = 1.5, size = 2.5, check_overlap = TRUE) + xlab("Valores ajustados") + 
  ylab("Residuos Studentizados")

# Identificación de puntos influyentes
summary(influence.measures(finalmodel))
