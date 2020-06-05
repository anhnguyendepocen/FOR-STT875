# ui.R file
# Databases Exercises

library(shiny)
library(RSQLite)
library(DBI)
library(dplyr)

con <- dbConnect(RSQLite::SQLite(), "myDBDir")

battingTable <- tbl(con, "batting")
baseballTable <- tbl(con, "baseball")

# Obtain the highest HR for a single season for HR slider
maxHR <- battingTable %>% 
  select(hr) %>% 
  summarize(value = max(hr)) %>% 
  collect()

ui <- fluidPage(
  
  titlePanel("Baseball Statistics Search"),
  
  sidebarLayout(
    sidebarPanel(
      sliderInput("rangeHR",
                  label = "Number of Home Runs:",
                  min = 0,
                  max = local(maxHR$value), 
                  value = c(0, local(maxHR$value)),
                  step = 1),
      
      numericInput("runInput", 
                   label = "Minimum Number of Runs",
                   value = 1),
      numericInput("rbiInput", 
                   label = "Minimum Number of RBIs",
                   value = 1),
      numericInput("yearInput",
                   label = "Year",
                   value = ''),
      checkboxInput("yearCheckbox",
                    label = "Use all years",
                    value = TRUE),
      submitButton("Submit")
    ), 
    mainPanel(
      # Create a new row for the table
      fluidRow(
        DT::dataTableOutput("table")
      )
    )
  )
)

server <- function(input, output) {
  
  output$table <- DT::renderDataTable(DT::datatable({
    dat <- battingTable %>% 
      inner_join(baseballTable) %>% 
      select(namefirst, namelast, yearid, hr, rbi, r) %>% 
      filter(hr >= local(input$rangeHR[1]) & hr <= local(input$rangeHR[2]) &
               r >= local(input$runInput) & rbi >= local(input$rbiInput) & 
               (local(input$yearCheckbox) | yearid == local(input$yearInput))) %>% 
      arrange(desc(hr))
    dat <- as.data.frame(dat)
    names(dat) <- c("First Name", "Last Name", "Year", "HR", "RBI", "R")
    dat
  }))
}

# Create Shiny app ----
shinyApp(ui = ui, server = server)