library(plotly)
setwd("../")
source("../../../PhD_SandersLab/local_analysis/Digital-Karyotype/R/utils.R",
    chdir = T
)
source("./splot.R")




plot_list <- list()
t <- seq(0, 10, 0.1)
y <- sin(t)
sine_df <- data.frame(
    t = t,
    y = y
)

plt1 <- ggplot(
    data = sine_df,
    aes(
        x = t,
        y = y
    )
) +
    geom_line()

sPlot(plt1, run_app = T)

plt2 <- Plot_Digital_Karyotype(plot_ideo_only = T)
ggplotly(plt2)
ggplotly(plt1)
ggsave(filename = "test.svg",
       plot = plt2,
       width = 29.7,
       height = 21
)
empty <- function() {
    
}

shinyApp(ui = NULL, 
         server = empty, 
         options = list(shiny.host = "0.0.0.0",
                        shiny.port = 2700))



str(plt2)

sPlot(plt2, run_app = T)



ls <- list()
length(ls)
ls[[length(ls) + 1]] <- plt1



plot_list[[2]] <- Plot_Digital_Karyotype(plot_ideo_only = T)
plot_list[[3]] <- Plot_Digital_Karyotype(
    plot_ideo_only = T,
    plot_both_haplotypes = F
)
