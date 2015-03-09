# server.R
library(forecast)
# url <- "http://utilities.dbh.govt.nz/userfiles/open-data/01/geometric-mean-rents-by-ta.csv"
DT <- read.csv("data/geometric-mean-rents-by-ta.csv")

shinyServer(function(input, output) {
        dataInput <- reactive({
                ts1 <- ts(subset(DT, select = input$symb), start = 1993, frequency=12)
                
                ets1 <- ets(ts1,model="MMM")
                forec <- forecast(ets1, h = 12)
        })

        output$plot <- renderPlot({
                plot(dataInput())
        })
        
        output$view <- renderPrint({
                print(dataInput())
        })
})