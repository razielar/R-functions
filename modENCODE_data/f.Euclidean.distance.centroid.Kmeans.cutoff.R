### Function to calculate the euclidean distance between the K-means 
### centroid and the genes with a determined cluster 
### August 27th 2019 

#### Additional information: In order to use this function you need the following: 
# -- 1) PCA of the genes: PCA_data.f <- prcomp(df, center = TRUE, scale. = TRUE)
#       df= genes in rows and samples in columns
# -- 2) Obtain the 2 dimensions: PCA_genes <- as.data.frame(PCA_data.f$x[,c(1:2)])
# -- 3) Put cluster information of k-means: PCA_genes$cluster <- erc_cluster$cluster
# -- 4) Formatting: PCA_genes$Gene <- rownames(PCA_genes)
# -- 5) df: rownames: gene_names, col_1: PC1, col_2: PC2, col_3: cluster, col_4: gene_names


f.Centroid.Euclidean.dist <- function(Input_matrix){
  
  require(dplyr)
  require(magrittr)
  
  
  
}









