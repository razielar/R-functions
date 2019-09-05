######### Function to create the df for plot the Aggregation plots for ATAC-seq
### September 5th 
### The df comes from bwtool aggregation 


f.plot.ATAC.seq <- function(input_matrx){
  
  require(reshape2)
  colnames(input_matrx)[2:3] <- c("Control", "Regeneration")
  
  df_plot <- melt(input_matrx, id="Position")
  
  return(df_plot)
  
}



