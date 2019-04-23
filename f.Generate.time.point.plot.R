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

f.Rearrange_labels <- function(Input_matrix){
  
  #Collapse transcripts into genes
  
  Gene.ID <- data.frame(Gene_ID=unique(Input_matrix[,1]))
  Gene.Name <- data.frame(Gene_Name=unique(Input_matrix[,2]))
  Result <- cbind(Gene.ID, Gene.Name)
  
  return(Result)
  
} 

f.Time_Point_lncRNAmRNA_pairs <- function(Expression_matrix, mRNA_lncRNA_pairs){
  
  require(reshape2)
  
  load("/users/rg/ramador/D_me/RNA-seq/ncRNAs/Final_Agreement_lncRNAs/Genomic_location/tmp_files/R_objects/New.label_lncRNA.rda")
  New.label_lncRNA <- f.Rearrange_labels(New.label_lncRNA)
  load("/users/rg/ramador/D_me/RNA-seq/ncRNAs/Final_Agreement_lncRNAs/Genomic_location/Coexpression_analysis/R_objects/mRNAs.genes.13880.rda")
  mRNA <- mRNA %>% select(Gene_ID, Gene_Name)
  
  lncRNA_name <- merge(Expression_matrix, New.label_lncRNA, by.x = "row.names", by.y = "Gene_ID", sort = FALSE)
  mRNA_name <- merge(Expression_matrix, mRNA, by.x = "row.names", by.y = "Gene_ID", sort = FALSE)
  
  expression_name <- rbind(lncRNA_name, mRNA_name)
  
  Final_matrix <- data.frame(matrix(NA, ncol = 9, nrow = nrow(mRNA_lncRNA_pairs)))
  colnames(Final_matrix) <- c("mRNA_gene", "lncRNA_gene", "0h_lncRNA", "15h_lncRNA", "25h_lncRNA","0h_mRNA", 
                              "15h_mRNA" , "25h_mRNA" ,"Gene_Pairs")
  
  Final <- NULL
  
  for(i in 1:nrow(mRNA_lncRNA_pairs)){
    
    Final_matrix[i,1] <- mRNA_lncRNA_pairs[i,1]
    Final_matrix[i,2] <- mRNA_lncRNA_pairs[i,2]
    
    tmp_matrix <- expression_name[which(expression_name$Gene_Name %in%  as.character(Final_matrix[i,1:2]) ),]
    ## -- lncRNAs:
    Final_matrix[i,3] <- tmp_matrix[1,c(2,3)] %>% as.matrix() %>% mean()
    Final_matrix[i,4] <- tmp_matrix[1,c(4,5)] %>% as.matrix() %>% mean()
    Final_matrix[i,5] <- tmp_matrix[1,c(6,7)] %>% as.matrix() %>% mean()
    
    ## -- mRNAs:
    Final_matrix[i,6] <- tmp_matrix[2,c(2,3)] %>% as.matrix() %>% mean()
    Final_matrix[i,7] <- tmp_matrix[2,c(4,5)] %>% as.matrix() %>% mean()
    Final_matrix[i,8] <- tmp_matrix[2,c(6,7)] %>% as.matrix() %>% mean()
    
    ## -- Gene Pairs:
    Final_matrix[i, 9] <- paste(tmp_matrix[1,8] , tmp_matrix[2,8] , sep = "_")
    
    kk <- melt(Final_matrix[i,])
    kk$Type <- c(rep("lncRNA",3), rep("mRNA", 3))
    
    Final <- rbind(Final, kk)
    
    # print(kk)
    # print(Final_matrix)
    
  }
  
  Final$variable <- as.character(Final$variable) %>% 
    strsplit(., split="_", fixed=TRUE) %>% lapply(., function(x){y <- x[1]}) %>% unlist()
    
  return(Final)
  
  
}









