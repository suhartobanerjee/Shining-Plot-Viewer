library(shiny)
library(shinyjs)


################################################################################




################################################################################
# Main App
ui <- fluidPage(
    useShinyjs(),
    verticalLayout(
        titlePanel("Plot Viewer"),
        wellPanel(
            actionButton("prev_button", "Previous"),
            actionButton("next_button", "Next")
        ),
        plotOutput("shiny_plot")
    )
)


server <- function(input, output, plot) {

    plot_list <- list()


    plot_list[[length(plot_list) + 1]] <- getShinyOption("plot_list")
    print(length(plot_list))
    
    
    max_len <- reactiveVal(length(plot_list))
    counter <- reactiveVal(1)
    shinyjs::disable("prev_button")


    observeEvent(input$next_button, {
        if (counter() == length(plot_list)) {
            shinyjs::disable("next_button")
        } else if (counter() == (length(plot_list) - 1)) {
            counter(counter() + 1)
            shinyjs::disable("next_button")
        } else {
            shinyjs::enable("prev_button")
            counter(counter() + 1)
        }
    })


    observeEvent(input$prev_button, {
        if (counter() == 1) {
            shinyjs::disable("prev_button")
        } else if (counter() == 2) {
            counter(counter() - 1)
            shinyjs::disable("prev_button")
        } else {
            shinyjs::enable("next_button")
            counter(counter() - 1)
        }
    })


    output$shiny_plot <- renderPlot(
        {
            if (max_len() > counter()) {
                
                print(plot_list[[max_len()]])
            } else {

                print(plot_list[[counter()]])
            }
        },
        width = 1100,
        height = 850
    )
}



options(
    shiny.host = "0.0.0.0",
    shiny.port = 2700
)
shinyApp(
    ui = ui,
    server = server
)



