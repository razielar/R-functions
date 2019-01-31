library(reshape2)
library(ggplot2)


f.Create.line.points <- function(Input_matrix){
  
  Initial_df <- Input_matrix
  number_genes <- nrow(Initial_df)
  gene_names <- rownames(Initial_df)
  Final_df <- c()
  
  for(i in 1:number_genes){
    
    tmp_melt <- melt(Initial_df[i,])
    tmp_melt$time_point <- tmp_melt$variable %>% as.character() %>%
      strsplit(., split="-", fixed=TRUE) %>% lapply(., function(x){y <- x[2]}) %>%
      unlist()
    
    tmp_melt$Treatment <- tmp_melt$variable %>% as.character() %>%
      strsplit(., split="-", fixed=TRUE) %>% lapply(., function(x){y <- x[1]}) %>%
      unlist()
    
    tmp_melt$Gene_label <- rep(gene_names[i], nrow(tmp_melt))
    Final_df <- rbind(Final_df, tmp_melt)
    
  }
  
  return(Final_df)
  
}
