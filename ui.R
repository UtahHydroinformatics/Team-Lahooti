
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

shinyUI(fluidPage(

  # Application title
  titlePanel("WQ App for Red Butte Creek and Green River"), tags$img(heigth = '100', width = '100', src = "myImage.png", align = "right"),


  # Sidebar with user input controls
  sidebarLayout( 
    sidebarPanel(
      selectInput(inputId = "site",
                             label = "Site",
                             choices = unique(greenriverdata$site_name),
                             selected = NULL,
                             multiple = FALSE,
                             selectize = TRUE,
                             width = NULL,
                             size = NULL),
      
      
                 selectInput(inputId = "param",
                             label = "Select parameter to plot: ",
                             choices = list('Water Temperature degC'='Wtemp_Inst',
                                            'Guage Height ft'='GH_Inst',
                                            'Discharge cft/sec'='Flow_Inst'),
                             selected = NULL,
                             multiple = FALSE,
                             selectize = TRUE,
                             width = NULL,
                             size = NULL),
      
      dateRangeInput("dates", label = h3("Date Range"))
      ),

    # Show outputs, text, etc. in the main panel
    mainPanel(
            textOutput("selected_var"),
      plotOutput("chlplot"),
      textOutput("modelresults"),
      h3(("Location of Sites WQ Monitoring Sites"),leafletOutput("sitemap"))
    )
  )
))