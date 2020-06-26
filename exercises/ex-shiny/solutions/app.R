# app.R
# CampsitesMI Solutions

library(shiny)
library(maps)
library(ggplot2)

sites <- read.csv("http://www.finley-lab.com/files/data/Michigan_State_Park_Campgrounds.csv")

ui <- fluidPage(
  
  titlePanel("Michigan Campsite Search"),
  
  sidebarLayout(
    sidebarPanel(
      sliderInput("rangeNum",
                  label = "Number of campsites:",
                  min = 0,
                  max = 420,
                  value = c(0,420),
                  step=20
      ),
      
      selectInput("type",
                  label = "Type of campsites:",
                  levels(sites$Camp_type)
      ),
      
      checkboxInput("ada",
                    label = "ADA Sites Available:",
                    FALSE), 
      checkboxGroupInput("districtChoice", 
                         label = "Choose district(s):", 
                         choices = levels(sites$DISTRICT), 
                         selected = levels(sites$DISTRICT))
    ),
    
    
    mainPanel(
      plotOutput("plot1"),
      br(),
      htmlOutput("text1")
    )
  )
)

server <- function(input, output) {
  
  output$text1 <- renderText({
    
    sites1 <- subset(sites, 
                     TOTAL_SITE >= input$rangeNum[1] & 
                       TOTAL_SITE <= input$rangeNum[2] &
                       Camp_type == input$type &
                       if(input$ada){ ADA_SITES > 0 } else {ADA_SITES >= 0} &
                       DISTRICT %in% input$districtChoice
                       )
    
    if(nrow(sites1) > 0){
      outStr <- "<ul>"
      for(i in 1:nrow(sites1)){
        outStr <- paste0(outStr,"<li>",sites1$FACILITY[i], ": ", sites1$TOTAL_SITE[i], "</li>")
      }
      outStr <- paste0(outStr,"</ul>")
    } else {
      outStr <- ""
    }
    
    paste("<p>There are",
          nrow(sites1), 
          "campgrounds that match your search:</p>", 
          outStr)
    
  })
  
  output$plot1 <- renderPlot({
    sites1 <- subset(sites, 
                     TOTAL_SITE >= input$rangeNum[1] &
                       TOTAL_SITE <= input$rangeNum[2] &
                       Camp_type == input$type &
                       if(input$ada){ ADA_SITES > 0 } else {ADA_SITES >= 0} & 
                       DISTRICT %in% input$districtChoice)
    
    miMap <- map_data("state", region = "michigan")
    plt <- ggplot() +
      geom_polygon(data=miMap, aes(x=long,y=lat,group=group), colour="black", fill="gray") +
      coord_fixed(ratio = 1)
    
    if(nrow(sites1) > 0){
      plt <- plt + geom_point(data = sites1,aes(x=Long,y=Lat, colour= COUNTY , size = TOTAL_SITE))
    } 
    
    plot(plt)
    
    plot(plt)
    
  })
  
}

# Create Shiny app ----
shinyApp(ui = ui, server = server)
