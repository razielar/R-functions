########################### Function to plot a PCA 
####### September 17th 2018 


f.PCA_treatment.time_point <- function(Input_matrix, title_plot, element_size=18, point_size=4,
                                       label_size=4.8){
  
  require(ggplot2)
  require(ggrepel)
  
  PCA_data.f <- prcomp(t(Input_matrix), center = TRUE, scale. = TRUE) #Transpose
  info_PCA <- summary(PCA_data.f)
  
  x_lab <- paste0("PC1: ",round(100*info_PCA$importance[2,1], digits = 2), "% variance")
  y_lab <- paste0("PC2: ",round(100*info_PCA$importance[2,2], digits = 2), "% variance")
  
  plot <- as.data.frame(PCA_data.f$x[,c(1:2)])
  
  ### Plot_labels: 
  
  name_plot <- rownames(plot)
  
  name_plot_treatment <- strsplit(name_plot, split = "-", fixed = TRUE) %>% 
    lapply(function(x){y <- x[1]}) %>% unlist()
  
  name_plot_time <- strsplit(name_plot, split = "-", fixed = TRUE) %>% 
    lapply(function(x){y <- x[2]}) %>% unlist()
  
  plot$Treatment <- name_plot_treatment
  plot$Time_Point <- name_plot_time
  
  ### Plot 
  
  set.seed(49)
  ggplot(data = plot)+geom_point(aes(x=PC1, y=PC2, shape=Time_Point), size=point_size, color="grey")+
    xlab(x_lab)+ylab(y_lab)+
    geom_label_repel(aes(x=PC1, y=PC2, fill=Treatment, label=rownames(plot)),
                     fontface='bold', color='white',
                     box.padding = 0.35, point.padding = 0.5,
                     segment.color = 'grey50', size=label_size)+
    theme(plot.title = element_text(hjust = 0.5,face = "bold"),
          axis.text.y = element_text(face = "bold"),
          axis.text.x = element_text(face = "bold"), text = element_text(size=element_size),
          axis.title.x = element_text(face = "bold"), axis.title.y = element_text(face="bold"),
          legend.title = element_text(face = "bold"))+
    ggtitle(title_plot)
  
  
}


