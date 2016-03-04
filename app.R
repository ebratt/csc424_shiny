source('util.R')
load_package('shiny')
ui <- fluidPage(
    # *Input() functions,
    # *Output() functions
    sliderInput(inputId = "num",           # unique id for object
                label="Choose a number",   # tell the user what to do
                value=25, min=1, max=1000), # add'l arguments
    plotOutput(outputId = "hist")
)


server <- function(input,output) {
    # write instructions to build outputs from inputs
    output$hist <- renderPlot({ 
        title <- concat(input$num, " random normal values")
        hist(rnorm(input$num), main=title, xlab=concat(input$num, " obs"))
    })
}


shinyApp(ui=ui, server=server)
