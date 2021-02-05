# GRUPO8-TRABAJO-FINAL
PROFESOR: ROY YALI SAMANIEGO

GRUPO:8
ALUMNOS_

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

