library(shiny)
library(shinyjs)
source("../../../PhD_SandersLab/local_analysis/Digital-Karyotype/R/utils.R",
    chdir = T
)
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

str(Plot_Digital_Karyotype)
server <- function(input, output) {
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
            plot(plot_list[[counter()]])
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




# Tests
plot_list <- list()
t <- seq(0, 10, 0.1)
y <- sin(t)
sine_df <- data.frame(
    t = t,
    y = y
)
plot_list[[1]] <- ggplot(
    data = sine_df,
    aes(
        x = t,
        y = y
    )
) +
    geom_line()
plot_list[[2]] <- Plot_Digital_Karyotype(plot_ideo_only = T)
plot_list[[3]] <- Plot_Digital_Karyotype(
    plot_ideo_only = T,
    plot_both_haplotypes = F
)
