library(shiny)
source("./utils.R")


ui <- fluidPage(

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

    i <- reactiveVal(1)
    observeEvent(input$next_button, {
            i(i() + 1)
            output$shiny_plot <- renderPlot({
                plot(plot_list[[i()]])
            },
            width = 1100,
            height = 850
            )
        }
        )

    observeEvent(input$prev_button, {
            i(i() - 1)
            output$shiny_plot <- renderPlot({
                plot(plot_list[[i()]])
            },
            width = 1100,
            height = 850
            )
       })


    output$shiny_plot <- renderPlot({
        plot(plot_list[[i()]])
    },
    width = 1100,
    height = 850
    )

}



options(shiny.host = '0.0.0.0',
        shiny.port = 2700
)
shinyApp(ui = ui,
         server = server
)




# Tests
plot_list <- list()
t=seq(0,10,0.1)
y=sin(t)
sine_df <- data.frame(t = t,
                      y = y
)
plot_list[[1]] <- ggplot(data = sine_df,
                         aes(x = t,
                             y = y
                         )
) +
                      geom_line()
plot_list[[2]] <- Plot_Digital_Karyotype(plot_ideo_only = T)
plot_list[[3]] <- Plot_Digital_Karyotype(plot_ideo_only = T,
                                         plot_both_haplotypes = F
)
