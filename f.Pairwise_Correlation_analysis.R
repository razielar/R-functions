############## Function to do the Pairwise-correlation 
######## October 9th 2018 



f.Pairwise_Correlation_analysis <- function(Pairs_elements, expression_matrix){
  
  require(dplyr)
  
  Final_df <- data.frame(matrix(nrow = nrow(Pairs_elements), ncol = 8))
  colnames(Final_df) <- c("lncRNA_gene", "mRNA_gene", "Pearson_cor", "Pearson_Adjust_p.value", 
                          "Spearman_cor", "Spearman_Adjust_p.value", "Mean_TPM_lncRNA", "Mean_TPM_mRNA")
  lncRNA_df <- c(); mRNA_df <- c()
  
  for(i in 1:nrow(Pairs_elements)){
    
    #The gene names is in the rownames; using the genes  
    lncRNA_df <- expression_matrix[rownames(expression_matrix) == Pairs_elements[i,1],]
    mRNA_df <- expression_matrix[rownames(expression_matrix) == Pairs_elements[i,3],]
    
    ##### Correlation
    #Pearson:
    cor_value_pearson <- cor.test(as.numeric(lncRNA_df), as.numeric(mRNA_df), exact = FALSE)$estimate %>% 
      as.numeric()
    pearson_p.value <- cor.test(as.numeric(lncRNA_df), as.numeric(mRNA_df), exact = FALSE)$p.value %>% 
      as.numeric()
    
    #Spearman:
    cor_value_spearman <- cor.test(as.numeric(lncRNA_df), as.numeric(mRNA_df), 
                                   method = "spearman", exact = FALSE)$estimate %>% as.numeric()
    spearman_p.value <- cor.test(as.numeric(lncRNA_df), as.numeric(mRNA_df), 
                                 method = "spearman", exact = FALSE)$p.value %>% as.numeric()
    
    ##### Expression
    #lncRNA:
    lncRNA_expression <- mean(as.numeric(lncRNA_df), na.rm = TRUE)
    #mRNA 
    mRNA_expression <- mean(as.numeric(mRNA_df), na.rm = TRUE)
    
    
    Final_df[i, 1] <- rownames(lncRNA_df)
    Final_df[i, 2] <- rownames(mRNA_df)
    Final_df[i, 3] <- cor_value_pearson %>% round(., digits=4)
    Final_df[i, 4] <- pearson_p.value %>% round(., digits=4)
    Final_df[i, 5] <- cor_value_spearman %>% round(., digits=4)
    Final_df[i, 6] <- spearman_p.value %>% round(., digits=4)
    Final_df[i, 7] <- lncRNA_expression %>% round(., digits=4)
    Final_df[i, 8] <- mRNA_expression %>% round(., digits=4)
    
  }
  
  Final_df$Pearson_Adjust_p.value <- p.adjust(Final_df$Pearson_Adjust_p.value, method = "BH")
  Final_df$Spearman_Adjust_p.value <- p.adjust(Final_df$Spearman_Adjust_p.value, method = "BH")
  
  Final_df <- Final_df[complete.cases(Final_df),]
  
  return(Final_df)
  
}



