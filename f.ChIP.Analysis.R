################### R-functions to plot ChIP-seq signals 

###### 1) Generate the df for ploting: the order must be: "RNApol", "H3K4me1", "H3K27ac"

f.Plot_ChIP_seq <- function(Input_1, Input_2, Input_3){
  
  require(reshape2)
  require(dplyr)
  
  colnames(Input_1)[1] <- "V1"; colnames(Input_2)[1] <- "V1"; colnames(Input_3)[1] <- "V1"
  
  tmp_plot <- merge(Input_1, Input_2, by.x= "V1", by.y="V1") %>% 
    merge(., Input_3, by.x= "V1", by.y="V1")
  
  colnames(tmp_plot) <- c("Position", "RNApol", "H3K4me1", "H3K27ac")
  
  plot_control <- melt(tmp_plot , id="Position") 
  colnames(plot_control)[2] <- "Chromatin_Mark"
  
  return(plot_control)
  
  
}


















