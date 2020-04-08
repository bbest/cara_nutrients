### Combine Nutrient data (serc and ws) per Reef and Subregion

library(ggplot2)
library(tidyverse)
library(vegan)
library(dygraphs)
library(rio)
library(readr)
library(ggplot2)
library(ggpubr)
library(hrbrthemes)
library(tibble)
library(reshape2)


setwd("C:/Users/cara.estes/Documents/Spring_2020/Nutrients/Nutrients_by_REEF")


## Dry Tortugas

Bird_Key_Reef_serc <- import("DT/Bird_Key_Reef_serc.xls")
Bird_Key_Reef_ws <- import("DT/Bird_Key_Reef_ws.xls")

## Change date to Year to merge the two dataframes

Bird_Key_Reef_serc_date <- format(as.Date(Bird_Key_Reef_serc$DATE_, format = "%Y %m %d"),"%Y")
Bird_Key_Reef_serc_frame <- data.frame(Bird_Key_Reef_serc_date)
Bird_Key_Reef_serc_year <- cbind(Bird_Key_Reef_serc_frame, Bird_Key_Reef_serc)
colnames(Bird_Key_Reef_serc_year)[1]<- "Year"


Bird_Key_Reef_ws_date <- format(as.Date(Bird_Key_Reef_ws$Date_, format = "%Y %m %d"),"%Y")
Bird_Key_Reef_ws_frame <- data.frame(Bird_Key_Reef_ws_date)
Bird_Key_Reef_ws_year <- cbind(Bird_Key_Reef_ws_frame, Bird_Key_Reef_ws)
colnames(Bird_Key_Reef_ws_year)[1]<- "Year"


Bird_Key_Reef_merge <-  left_join(Bird_Key_Reef_serc_year,Bird_Key_Reef_ws_year)
