library(shiny)

ui <- fluidPage(
  h1("Let's do a quick survey."),
  p("Instructions: Answer the following questions: "),
  textInput(inputId = "userName",
            label = "What is your name?"),
  radioButtons(
    inputId = "radio",
    label = "Is cereal soup?",
    choices = list("yes", "no", "maybe"),
    selected = 2
  ),
  h1("Your answers:"),
  textOutput(outputId = "greeting"),
  textOutput(outputId = "radioMessage")
)

server <- function(input, output) {
  output$greeting <- renderText({
    paste("Hello! ", input$userName)
  })
  
  output$radioMessage <- renderText({
    paste("You selected ", input$radio)
    if (input$radio == "yes") {
      paste("You think cereal is soup")
    } else if (input$radio == "no") {
      paste("You do not think cereal is soup")
    } else {
      paste("You are unsure of whether or not cereal is soup")
    }
  })
  
}

shinyApp(ui = ui, server = server)