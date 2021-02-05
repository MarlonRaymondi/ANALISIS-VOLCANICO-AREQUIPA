# GRUPO8-TRABAJO-FINAL
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


# DETERMINACIÓN DE LA ACTIVIDAD VOLCÁNICA EN EL DEPARTAMENTO DE AREQUIPA

## Extraemos la data
(https://www.geogpsperu.com/2018/05/volcanes-activos-e-inactivos-ingemmet.html "Volcanes Activos e Inactivos INGEMMET - GEOCATMIN | SHP + KMZ")

## Cargando librerías
library(sf)

library(tidyverse)

library(dplyr)

library(mapview)

library(ggplot2)

library(tmap)


## Cargando la data 
st_read("OTROS VOLCANES INGEMMET GEOCATMIN GEOGPSPERU.shp")

volcan <- st_read("OTROS VOLCANES INGEMMET GEOCATMIN GEOGPSPERU.shp")

## Filtrando datos solo del departamento de Arequipa
volc_areq<-volcan %>%

  filter(DEPARTAMEN =="AREQUIPA")
	
## Visualización de los volcanes de Arequipa 
Para esto utilizaremos la librería Mapview:

mapview(st_geometry(volc_areq))

![Volcanes de Arequipa](https://user-images.githubusercontent.com/78512276/106982945-ab96b480-672a-11eb-99ee-04ae5d2ae356.png)

## Visualización  por  latitud de los volcanes de Arequipa
tm_shape(volc_areq)+

  tm_bubbles(col = "LATITUD", size = 0.5)+
  
  tm_layout(title = "Latitud de los volcanes de Arequipa",legend.position = c(0.01,0.08),title.position = c(0.01,0.05))
  
  ![altitud](https://user-images.githubusercontent.com/78512276/106985801-b43db980-672f-11eb-92d5-271e0c8f7f23.png)
