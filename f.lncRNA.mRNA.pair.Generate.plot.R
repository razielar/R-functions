###### Function to generate pair lncRNA:mRNA from Gene_ID and expression matrix
###### September 6th 2019 
### expression_matrix: gene in rows, samples in columns
### lncRNA_mRNA: lncRNA_GeneID, lncRNA_GeneName, mRNA_GeneID, mRNA_GeneName

f.lncRNA.mRNA.pair <- function(expression_matrix, lncRNA_mRNA){
  require(dplyr)
  require(magrittr)
  require(reshape2)
  
  for(i in 1:nrow(lncRNA_phenotype)){
    
    cat(i, "\n")
    gene_pairs <- df_pair_plot[i,c(1,3)] %>% as.character()
    df_plot <- expression_matrix[which(rownames(expression_matrix) %in% gene_pairs),]
    df_plot <- melt(t(df_plot))
    ### Add GeneName:
    
    gene_name_pairs <- df_pair_plot[i,c(2,4)] %>% as.character()
    df_plot$Gene <- c(rep(gene_name_pairs[2], nrow(df_plot)/2),
                      rep(gene_name_pairs[1], nrow(df_plot)/2))
    
    ### mRNA always first in factors
    df_plot$Gene <- as.factor(df_plot$Gene)
    
    if( as.character(levels(df_plot$Gene)[1]) == gene_name_pairs[2]  ){
      df_plot$Gene <- factor(df_plot$Gene, levels = levels(df_plot$Gene)[c(1,2)])
    } else {
      df_plot$Gene <- factor(df_plot$Gene, levels = levels(df_plot$Gene)[c(2,1)])
      }
    
    print(levels(df_plot$Gene) )
    
  }
  
}


f.lncRNA.mRNA.pair(expression_matrix = regeneration, lncRNA_mRNA = df_pair_plot)











