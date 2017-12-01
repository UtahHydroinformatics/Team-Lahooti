library(shiny)
library(ggplot2)
greenriverdata$site_name <- ifelse(greenriverdata$site_no == 10172200, "Red_Butte_Creek", "Green_River")
help(ifelse)
greenriverdata$Wtemp_Inst[greenriverdata$Wtemp_Inst== -999999] <- NA
library(leaflet)

