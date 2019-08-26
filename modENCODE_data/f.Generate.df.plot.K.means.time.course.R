######## Generate dataframe for plot the k-means clusters for modENCODE dataset

f.df.Kmeans.TimeCourse <- function(Input_matrix, num_cluster= c(1,2,3,4,5)){
  
  require(dplyr)
  require(reshape2)
  
  cluster_df <- Input_matrix %>% mutate(Gene_ID=rownames(Input_matrix)) %>%
    filter(cluster == num_cluster) %>% select(-cluster)
  
  rownames(cluster_df) <- cluster_df$Gene_ID
  cluster_df$Gene_ID <- NULL
  
  cluster_df <- melt(cluster_df)
  
  return(cluster_df)
  
}

### --- Usage: 
# f.df.Kmeans.TimeCourse(Input_matrix = expression, num_cluster = 1)

