########### Function to make a t-SNE: 

options(stringsAsFactors = FALSE)
library(dplyr)
library(Rtsne)
library(ggplot2)
library(ggrepel)

f.tSNE.specific.samples <- function(Input_matrix, perplexity=30, point_size=4,
                                    label_size=4.8, element_size=10, title_plot=""){
  
  t.SNE_input <- t(Input_matrix)
  
  set.seed(1)
  tSNE_result <- Rtsne(t.SNE_input, dims= 2, initial_dims= 50, theta= 0.0,
                       pca=TRUE, verbose=TRUE, is_distance=FALSE, perplexity = perplexity)
  
  tSNE_result <- as.data.frame(tSNE_result$Y)
  
  ### Plot:
  name_plot <- rownames(t.SNE_input)
  name_plot_treatment <- strsplit(name_plot, split = "-", fixed = TRUE) %>% 
    lapply(function(x){y <- x[1]}) %>% unlist()
  name_plot_time <- strsplit(name_plot, split = "-", fixed = TRUE) %>% 
    lapply(function(x){y <- x[2]}) %>% unlist()
  tSNE_result$Treatment <- name_plot_treatment
  tSNE_result$Time_Point <- name_plot_time
  
  ggplot(data = tSNE_result)+geom_point(aes(x=V1, y=V2, shape=Time_Point), size=point_size, color="grey")+
    xlab("Y1")+ylab("Y2")+
    geom_label_repel(aes(x=V1, y=V2, fill=Treatment, label=rownames(t.SNE_input)),
                     fontface='bold', color='white',
                     box.padding = 0.35, point.padding = 0.5,
                     segment.color = 'grey50', size=label_size)+
    ggtitle(title_plot)+
    theme(plot.title = element_text(hjust = 0.5,face = "bold"),
          axis.text.y = element_text(face = "bold"),
          axis.text.x = element_text(face = "bold"), text = element_text(size=element_size),
          axis.title.x = element_text(face = "bold"), axis.title.y = element_text(face="bold"),
          legend.title = element_text(face = "bold"))
  
  
}



### More information of tSNE: https://distill.pub/2016/misread-tsne/










