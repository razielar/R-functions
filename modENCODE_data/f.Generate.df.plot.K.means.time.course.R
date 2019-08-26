######## Generate dataframe for plot the k-means clusters for modENCODE dataset

f.df.Kmeans.TimeCourse <- function(Input_matrix, num_cluster= c(1,2,3,4,5)){
  
  require(dplyr)
  require(reshape2)
  
  cluster_df <- Input_matrix %>% mutate(Gene_ID=rownames(Input_matrix)) %>%
    filter(cluster == num_cluster) %>% select(-cluster)
  rownames(cluster_df) <- cluster_df$Gene_ID
  cluster_df$Gene_ID <- NULL

  cluster_df <- melt(t(cluster_df)) #t()

  return(cluster_df)

}

### --- Usage: 
# f.df.Kmeans.TimeCourse(Input_matrix = expression, num_cluster = 1)

### --- Plot: 
# /nfs/users2/rg/ramador/D_me/RNA-seq/modENCODE_data/K_means/Plots/K-means.raw.1428.lncRNA.pdf

# cluster_1 <- f.df.Kmeans.TimeCourse(Input_matrix = expression, num_cluster = 1)

# ggplot(data = cluster_1, aes(x=Var1, y=value, group=Var2))+geom_line(size=0.08)+
#   geom_point(size=0.8)+xlab("")+ylab("log10(TPM+0.01)")+ggtitle("Cluster 1: 11 lncRNAs")+
#   theme(plot.title = element_text(hjust = 0.5, face = "bold"),
#         axis.text.y = element_text(face = "bold"),
#         axis.text.x = element_text(face = "bold", angle = 45, hjust = 1),
#         text = element_text(size=8, face = "bold"))+ylim(-2, 6)

