library(shiny)

shinyUI(fluidPage(
  titlePanel("Forecast Rental bond of New Zealand"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("This data comes from MBIE’s tenancy bond database, 
               which records all new rental bonds that are lodged each month. 
               I forecasted the 2015 rental price based on them dataset which from 1993 to 2014."),
     
      selectInput("symb", label = h3("Chose a City"), 
                  choices = list("Auckland", "Christchurch","Dunedin","Hamilton",
                  "Invercargill","Lower.Hutt","Manukau","Napier","Nelson","North.Shore",
                "Palmerston.North","Porirua","Upper.Hutt","Waitakere",
                "Wellington","National"), selected = 1),
      
      helpText("Code source: https://github.com/lunagui/ForecastRental")
    ),
    
    mainPanel(plotOutput("plot"))
  )
))