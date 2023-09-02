library(ggplot2)
source("./app.R")

sPlot <- function(plot = NULL, run_app = F) {
    
    shinyOptions(plot_list = plot)

    if (run_app) {
        plot <- ggplot()

        shinyOptions(plot_list = plot)
        runApp(".")
    }
}


