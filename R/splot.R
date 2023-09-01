source("./app.R")

sPlot <- function(plot, run_app = F) {
    

    if (run_app) {
        shinyOptions(plot_list = plot)
        runApp(".")
    }
}


