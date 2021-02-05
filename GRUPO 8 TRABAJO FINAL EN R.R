library(sf)
library(dplyr)
library(tidyverse)
library(mapview)
library(ggplot2) 
library(tmap) 


setwd("C:/Users/lapto/OneDrive/Escritorio/MAYO/descargas/OTROS VOLCANES GEOCATMIN INGEMMET GEOGPSPERU")
st_read("OTROS VOLCANES INGEMMET GEOCATMIN GEOGPSPERU.shp")

#1usando libreria sf
volcan <- st_read("OTROS VOLCANES INGEMMET GEOCATMIN GEOGPSPERU.shp")
View(volcan)
head(volcan)

#2usando libreria tidyverse y dplyr

volc_areq<-volcan %>%
  filter(DEPARTAMEN =="AREQUIPA")

#3usando libreria mapview

mapview(st_geometry(volc_areq))



#4usando libreria tmap


tm_shape(volc_areq)+
  tm_bubbles(col = "LATITUD", size = 0.5)+
tm_layout(title = "Latitud de los volcanes de Arequipa",legend.position = c(0.01,0.08),title.position = c(0.01,0.05))

#5usando libreria ggplot

ggplot(volc_areq, mapping = aes(x= ELEVACION, y= VOLUMEN, 
                                color = CATEGORIA)) + geom_point() + 
  geom_smooth(method = 'lm') +
  ggtitle("RELACION ENTRE VOLUMEN Y ELEVACION") +
  theme(plot.title = element_text(hjust = 0.5))


ggplot(volc_areq, mapping = aes(x= CATEGORIA, y= ALTITUD,
                                color = CATEGORIA)) +
  geom_jitter() +
  ggtitle("RELACION DE ALTITUD Y ACTIVIDAD VOLCANICA")+
  theme(plot.title = element_text(hjust = 0.5))



  
 
  
  
  
 