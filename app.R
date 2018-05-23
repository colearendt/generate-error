library(shiny)

ui <- fluidPage(
    
    # Application title
    titlePanel("Press Button to Generate Error"),
    
    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            actionButton("error", "Generate Error")
        ),
        
        # Show a plot of the generated distribution
        mainPanel(
           textOutput("text")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
    value <- reactiveVal(0)
    secondTimer <- reactiveTimer(1000)
    observeEvent(secondTimer(), {
        value(value() + 1)
    })
    output$text <- renderText(paste0(
        "Time: " , as.character(value())
    ))
    observeEvent(input$error, {stop("Generated an error")})
}

# Run the application 
shinyApp(ui = ui, server = server)

