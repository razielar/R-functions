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

####### 2) Generate the df for plotting in one plot a Histone mark for Control_Up_0h, 
      #### Control_not_Up_0h, Regeneration_Up_0h, Regeneration_not_Up_0h


f.FourV_OneHistoneMark_per_Plot <- function(Control_Up, Control_Not_Up,
                                            Regene_Up_0h, Regene_Not_Up_0h){
  
  require(reshape2)
  
  df_plot <- cbind(Control_Up, Control_Not_Up$V2, Regene_Up_0h$V2, Regene_Not_Up_0h$V2)
  
  colnames(df_plot) <- c("Position", "Control_Up_0h", "Control_not_Up_0h", 
                         "Regeneration_Up_0h", "Regeneration_not_Up_0h")
  
  tmp_plot <-  melt(df_plot, id="Position")
  
  tmp_plot$Treatment <- tmp_plot$variable %>%  as.character() %>%
    strsplit(., split="_", fixed=TRUE) %>% lapply(., function(x){y <- x[1]}) %>% 
    unlist()
  
  return(tmp_plot)
  
}