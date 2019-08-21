#### Function to calculate the euclidean distance between the K-mean
#### centroid and the genes within a determined cluster 
#August 21st 2019

f.Centroid.Euclidean.dist <- function(Input_matrix){
  
  require(dplyr)
  
  Input_matrix <- as.data.frame(Input_matrix)
  Input_matrix$Dist <- NA
  mean_PC1 <- mean(Input_matrix$PC1)
  mean_PC2 <- mean(Input_matrix$PC2)
  
  row_name <- rownames(Input_matrix)
  
  for(i in 1:nrow(Input_matrix)){
    
    gene_coor <- as.numeric(Input_matrix[i,1:2] )
    matrix_gene <- rbind(gene_coor, c(mean_PC1, mean_PC2))
    matrix_gene <- as.numeric(dist(matrix_gene, method = "euclidean") )
    Input_matrix[i,5] <- matrix_gene
    
  }
  
  return(as.data.frame(Input_matrix))
  
}

#### --- Usage: 
# PCA_genes %<>% group_by(cluster) %>% 
#   do(f.Centroid.Euclidean.dist(.)) %>% as.data.frame()

#### Good explanation of K-means: https://www.datanovia.com/en/lessons/k-means-clustering-in-r-algorith-and-practical-examples/
