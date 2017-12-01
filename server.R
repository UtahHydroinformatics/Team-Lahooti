
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

shinyServer(function(input, output)
  {
 output$selected_var <- renderText({
   paste('Viewing water quality data at',input$site, 'between', input$dates[1],
                'and', input$dates[2])
   })
 output$chlplot <- renderPlot({ 
   plotdata<- subset(greenriverdata,site_name==input$site &
                                                     dateTime >= input$dates[1] &
                                                     dateTime<= input$dates[2])
   
 ggplot(data=plotdata,aes(x=plotdata$dateTime,y=plotdata[,input$param]))+geom_point() 
 
 
  })
 
 output$sitemap <- renderLeaflet({
   labels= c("Green River", "Red Butte Creek")
   longs=  c(-109.2375, -111.8052)
   lats=   c(40.4094, 40.78)
   leaflet() %>%
     addTiles() %>%
     addMarkers(lng=longs, lat=lats, popup = labels)
 })
 
 
 mod <- reactive({
   plotdata <- subset(greenriverdata,SiteName==input$site &
                        dateTime >= input$dates[1] &
                        dateTime<= input$dates[2])
   mod <- lm(plotdata$dateTime~plotdata[,input$param])
   modsummary <- summary(mod)
   return(modsummary)
 })

 
})