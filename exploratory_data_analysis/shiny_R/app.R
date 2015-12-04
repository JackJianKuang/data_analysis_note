# install.packages("shiny")
library(shiny)
ui <- fluidPage(
    # this input will provide a value saved as input$num
    sliderInput(inputId = "num",
        label = "Choose a number",
        value = 25, min = 1, max = 100),
    textInput(inputId = "title",
        label = "Write a title",
        value = "Histogram of Random Normal Values"),
    actionButton(inputId = "go", label = "Update"),
    plotOutput("hist"),
    verbatimTextOutput("stats")
)
# Use the server function to assemble inputs into outputs.
# Follow 3 rules:
# 1. Save the output that you build to output$
# 2. Build the output with a render*() function
# 3. Access input values with input$
server <- function(input, output) {
    # Reactive values work together with reactive functions.
    # You cannot call a reactive value from outside of one. 
    data <- reactive({
        rnorm(input$num)
    })
    output$hist <- renderPlot({
        hist(data(), main = isolate({input$title}))
    })
    output$stats <- renderPrint({
        summary(data())
    })
    observeEvent(input$clicks, {
        print(as.numeric(input$clicks))
    })
    # delay reactions
    eventReactive()
}
shinyApp(ui = ui, server = server)