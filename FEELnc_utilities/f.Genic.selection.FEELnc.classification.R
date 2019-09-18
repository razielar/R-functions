################ Function to classify genic lncRNAs:
### September 17th 2019

########## 1) With this function select the best option based on: "isBest"
f.select_genic <- function(Input_matrix){
  
  Input_matrix <- as.data.frame(Input_matrix)
  Genic <- NULL
  
  #Select the best one:
  best_value <- unique(Input_matrix[Input_matrix$isBest == 1,][,7])
  best_df <- Input_matrix[which(Input_matrix$type %in% best_value),]
  
  Genic <- rbind(Genic, best_df)
  
  if(length(best_value) > 1){
    
    print("Intergenic")
    best_genic <- best_df[best_df$isBest == 1 & best_df$type == "genic",]
    if( nrow(best_genic) == 0 ){
      best_genic <- Input_matrix[Input_matrix$type == "genic",]
    }
    Genic <- rbind(Genic, best_genic)
  }
  return(Genic)
}

### Usage: 
# genic <- feelnc_input %>% group_by(lncRNA_gene) %>% do(f.select_genic(.)) %>% 
#   as.data.frame()

########## 2) Keep the unique genic output based on unique partner_mRNA
f.Keep.unique.genic <- function(Input_matrix){
  
  Input_matrix <- as.data.frame(Input_matrix)
  tmp_df <- Input_matrix[Input_matrix$isBest == 1 & Input_matrix$type == "genic",]
  partner_mRNA <- unique(tmp_df$partnerRNA_gene)
  
  polish_genic <- NULL
  
  for(i in 1:length(partner_mRNA)){
    
    selected <- tmp_df[tmp_df$partnerRNA_gene %in% partner_mRNA[i],][1,]
    polish_genic <- rbind(polish_genic, selected)
    
  }
  return(polish_genic)
}

### Usage: 

# genic %<>% group_by(lncRNA_gene) %>% do(f.Keep.unique.genic(.)) %>%
#   as.data.frame() 

