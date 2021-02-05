# GRUPO8-TRABAJO-FINAL
CURSO: PROGRAMACIÓN

PROFESOR: ROY YALI SAMANIEGO

GRUPO:8

ALUMNOS:

|             INTEGRANTES                 |   CÓDIGO   |
|:----------------------------------------|-----------:|
| GENECIS ESCARLET, CHAGUA CCOSCO         |  19160196  |
| MARICIELO BERNADETTE, MORALES ROSAS     |  19160030  |
| MONICA LUISA,QUISPE APAZA               |  19160188  |
| MARLON ORLANDO, RAYMONDI DÍAZ           |  19160170  |
| LUIS ANTONIO, TREJO PORTILLA            |  19160163  |


# ANÁLISIS DE LA ACTIVIDAD VOLCÁNICA EN EL DEPARTAMENTO DE AREQUIPA

## Extraemos la data
(https://www.geogpsperu.com/2018/05/volcanes-activos-e-inactivos-ingemmet.html "Volcanes Activos e Inactivos INGEMMET - GEOCATMIN | SHP + KMZ")

(https://www.geogpsperu.com/2018/02/limite-distrital-politico-shapefile-ign.html "Limite Distrital- Político)

## Cargando librerías
~~~
library(sf)

library(tidyverse)

library(dplyr)

library(mapview)

library(ggplot2)

library(tmap)
~~~

## Cargando la data 
~~~â
st_read("OTROS VOLCANES INGEMMET GEOCATMIN GEOGPSPERU.shp")

volcan <- st_read("OTROS VOLCANES INGEMMET GEOCATMIN GEOGPSPERU.shp")

dist <- st_read("DISTRITOS.shp")
~~~

## Filtrando datos solo del departamento de Arequipa
~~~
volc_areq<-volcan %>%

  filter(DEPARTAMEN =="AREQUIPA")
  

dist_areq <- dist %>%

  filter(DEPARTAMEN == "AREQUIPA")
~~~

## Visualización de los volcanes de Arequipa por distrito 
Para esto utilizaremos la librería Mapview:
~~~
mapview(dist_areq , zcol = "DISTRITO" , 

        layer.name = "DISTRITOS DE AREQUIPA") + 
	
  mapview(st_geometry(volc_areq))

~~~

![Volanes de Arequipa por distrito](https://user-images.githubusercontent.com/78512423/107091386-b5262800-67cf-11eb-8853-ce25c2fc311d.png)

## Visualización  por  latitud de los volcanes de Arequipa
~~~
tm_shape(dist_areq) + tm_symbols()+ tm_layout(frame=T)

tm_shape(dist_areq) + 

  tm_polygons(col = "DISTRITO") +
  
  tm_shape(volc_areq)+
  
  tm_bubbles(col = "ALTITUD", size = 0.5)+
  
  tm_layout(frame = T) 
 ~~~ 
 ![TMAP](https://user-images.githubusercontent.com/78512423/107094129-82caf980-67d4-11eb-803e-487244e1d043.png)
  
## Relación entre dos variables
~~~
ggplot(volc_areq, mapping = aes(x= ELEVACION, y= VOLUMEN, 

color = CATEGORIA)) + geom_point() + 
				
  geom_smooth(method = 'lm') +
  
  ggtitle("RELACION ENTRE VOLUMEN Y ELEVACION") +
  
  theme(plot.title = element_text(hjust = 0.5))
~~~

  ![IMAGEN3](https://user-images.githubusercontent.com/78512276/106987519-43000580-6733-11eb-8880-36c6e2ba7ade.png)
  
  
  ## Relación altitud y la actividad volcánica
  ~~~
  ggplot(volc_areq, mapping = aes(x= CATEGORIA,   y= ALTITUD,  
                                    color = CATEGORIA)) + 
				
 geom_jitter() + 
 
 ggtitle("RELACION DE ALTITUD Y ACTIVIDAD VOLCANICA")+
 
  theme(plot.title = element_text(hjust = 0.5))
  ~~~
  
  ![IMAGEN4](https://user-images.githubusercontent.com/78512276/106988025-4e9ffc00-6734-11eb-919e-3a3fe054d78e.png)
