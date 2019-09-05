######### Function to create the df for plot the Aggregation plots for ATAC-seq
### September 5th 
### The df comes from bwtool aggregation 


f.plot.ATAC.seq <- function(input_matrx){
  
  require(reshape2)
  colnames(input_matrx)[2:3] <- c("Control", "Regeneration")
  
  df_plot <- melt(input_matrx, id="Position")
  
  return(df_plot)
  
}

### Usage: 
# intronic_genic <- f.plot.ATAC.seq(input_matrx = intronic_genic)

### Plot: 
# ggplot(data = intronic_genic, aes(x=Position, y=value, color=variable))+
#   geom_line()+ggtitle("ATAC-seq: genic-intronic (7) upregulated at 0h")+
#   ylab("ATAC-seq Read Density at 0h")+xlab("")+
#   scale_color_manual(values = c("chartreuse4", "orange2"))+
#   theme(plot.title = element_text(hjust = 0.5, face = "bold"), 
#         axis.text.y = element_text(face = "bold"),
#         axis.text.x = element_text(face = "bold"), 
#         text = element_text(size=10, face = "bold"),
#         legend.title = element_text(color = "white"))

