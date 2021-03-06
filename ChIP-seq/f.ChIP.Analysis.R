################### R-functions to plot ChIP-seq signals: 
### September 11th 2019

### This function is not longer useful it was when I didn't know how to use bwtool:
###### Generate the df for ploting: the order must be: "RNApol", "H3K4me1", "H3K27ac"
# f.Plot_ChIP_seq <- function(Input_1, Input_2, Input_3){
#   require(reshape2)
#   require(dplyr)
#   colnames(Input_1)[1] <- "V1"; colnames(Input_2)[1] <- "V1"; colnames(Input_3)[1] <- "V1"
#   tmp_plot <- merge(Input_1, Input_2, by.x= "V1", by.y="V1") %>% 
#     merge(., Input_3, by.x= "V1", by.y="V1")
#   colnames(tmp_plot) <- c("Position", "RNApol", "H3K4me1", "H3K27ac")
#   plot_control <- melt(tmp_plot , id="Position") 
#   colnames(plot_control)[2] <- "Chromatin_Mark"
#   return(plot_control)
# }

### --- bwtool command: 
# bwtool aggregate up:down bed_file.txt \
# NIH3K4m1_quantile-normalized.bw,NIRNApol_quantile-normalized.bw,NIH3K27ac_quantile-normalized.bw \
# /dev/stdout -starts -header > output

###### 1) Generate the df for the 3 Histone Marks: 
      ### Generate one plot with one condition (Control or Regeneration) and 3 histone marks
      ### Order: H3K4m1, RNApol, H3K27ac

f.Plot_ChIP_3HistoneMarks_Condition <- function(input_matrix){
  
  require(reshape2)
  colnames(input_matrix) <- c("Position", "H3K4me1", "RNApolII", "H3K27ac")
  plot_df <- melt(input_matrix, id="Position")
  return(plot_df)

}

### Usage: 
# control_chipseq <- f.Plot_ChIP_3HistoneMarks_Condition(input_matrix = control_chipseq)

### --- Plot: 
# ggplot(data = control_chipseq, aes(x=Position, y=value, color=variable))+
#   geom_line()+ggtitle("ChIP-seq Control: upregulated lncRNAs at 0h (84)")+
#   xlab("")+ylab("Average quantile-normalized ChIP-seq signal")+
#   theme(plot.title = element_text(hjust = 0.5, face = "bold"), 
#         axis.text.y = element_text(face = "bold"),
#         axis.text.x = element_text(face = "bold"),
#         text = element_text(size=10, face = "bold"),
#         legend.title = element_text(color = "white"))

####### 2) Generate the df for plotting in one plot a Histone mark for: 
# Control: up,down and flat & Regeneration: up, down and flat at 0h 

### --- bwtool command: 
# bwtool aggregate n:n $mRNA_up,$mRNA_down,$mRNA_flat \
#       NIH3K4me1_CONTROL_quantile-normalized.bw /dev/stdout -starts -header> out
# bwtool aggregate n:n $mRNA_up,$mRNA_down,$mRNA_flat \
#       NIH3K4me1_REGENERATION_quantile-normalized.bw /dev/stdout -starts -header> out

### Order: mRNA_up, mRNA_down, mRNA_flat: Control & Regeneration: 

f.Six_OneHistoneMark_per_Plot <- function(input_control, input_regeneration){
  
  require(dplyr)
  require(reshape2)
  
  colnames(input_control) <- c("Position", "Up_Control", "Down_Control", 
                               "Flat_Control")
  colnames(input_regeneration) <- c("Position", "Up_Regeneration", 
                                    "Down_Regeneration", "Flat_Regeneration")
  
  final <- merge(input_control, input_regeneration, by.x="Position",
                 by.y="Position")
  
  plot <- melt(final, id="Position")
  plot$DGE <- plot$variable %>% as.character() %>% 
    strsplit(., split="_", fixed=TRUE) %>% 
    lapply(., function(x){y <- x[1]}) %>% unlist()
  
  plot$Treatment <- plot$variable %>% as.character() %>% 
    strsplit(., split="_", fixed=TRUE) %>% 
    lapply(., function(x){y <- x[2]}) %>% unlist()
  
  ### Change leves 
  
  plot$DGE <- as.factor(plot$DGE)
  plot$DGE <- factor(plot$DGE, 
                     levels = levels(plot$DGE)[c(3,1,2)])
  
  plot$Treatment <- as.factor(plot$Treatment)
  plot$Treatment <- factor(plot$Treatment,
                           levels= levels(plot$Treatment)[c(2,1)])
  
  return(plot)
  
  
}

### Usage: 

# tmp <- f.Six_OneHistoneMark_per_Plot(input_control = control_H3K4me1,
#                               input_regeneration = regene_H3K4me1)

### Plot: 

# ggplot(data = tmp, aes(x=Position, y=value, color=DGE, linetype=Treatment))+
#   geom_line()+ggtitle("mRNA ChIP-seq: H3K3me1 at 0h")+xlab("")+ylab("ChIP-seq signal")+
#   scale_color_manual(values = c("firebrick2", "dodgerblue2", "gray"))+
#     theme(plot.title = element_text(hjust = 0.5, face = "bold"),
#           axis.text.y = element_text(face = "bold"),
#           axis.text.x = element_text(face = "bold"),
#           text = element_text(size=10, face = "bold"),
#           legend.title = element_text(color = "white"))


# f.FourV_OneHistoneMark_per_Plot <- function(Control_Up, Control_Not_Up,
#                                             Regene_Up_0h, Regene_Not_Up_0h){
#   
#   require(reshape2)
#   
#   df_plot <- cbind(Control_Up, Control_Not_Up$V2, Regene_Up_0h$V2, Regene_Not_Up_0h$V2)
#   
#   colnames(df_plot) <- c("Position", "Control_Up_0h", "Control_not_Up_0h", 
#                          "Regeneration_Up_0h", "Regeneration_not_Up_0h")
#   
#   tmp_plot <-  melt(df_plot, id="Position")
#   
#   tmp_plot$Treatment <- tmp_plot$variable %>%  as.character() %>%
#     strsplit(., split="_", fixed=TRUE) %>% lapply(., function(x){y <- x[1]}) %>% 
#     unlist()
#   
#   return(tmp_plot)
#   
# }
