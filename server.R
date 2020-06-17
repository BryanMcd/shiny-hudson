df <- readRDS("Shiny.RDS")
library(ggplot2)

server <- function(input, output) {
  
  observe({
    if (input$password=="kaechlab"){
      req(input$go)
      
                                  
       bubble <- df[grepl(paste0(input$Gene, collapse = "$|"), df$gene), ]
    
       output$lfc <- renderPlot(ggplot(bubble) +
                            geom_point(aes(x=comparison, y=gene, 
                                           color=l2fc, 
                                           size=-log10(padj), 
                                           shape=padj<0.05)) +
                            scale_color_gradient2(low = "blue", mid = "grey", high = "red", midpoint = 0) +
                            scale_shape_manual(values = c(0,16)) +
                            scale_size_continuous(breaks = c(1,10,50,100), 
                                                  labels = c(1,10,50,">100"),
                                                  name = "-log10(padj)",
                                                  range = c(1,10)) +
                            labs(x="") +
                            theme_bw() +
                            theme(panel.grid.major = element_blank(),
                                  axis.text.x = element_text(angle = 45, vjust = 0.5, hjust=1))
                            )
    }
  })
}
