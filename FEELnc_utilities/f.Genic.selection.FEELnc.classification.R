################ Function to classify genic lncRNAs:
### September 17th 2019

f.select_genic <- function(Input_matrix){
  
  Input_matrix <- as.data.frame(Input_matrix)
  Genic <- NULL
  
  #Select the best one:
  best_value <- unique(Input_matrix[Input_matrix$isBest == 1,][,7])
  # print(best_value)
  best_df <- Input_matrix[which(Input_matrix$type %in% best_value),]
  
  Genic <- rbind(Genic, best_df)
  # print(best_value)
  # condition <- str_detect("^intergenic", best_value)
  # print(condition)
  
  if(best_value %in% "intergenic"){
    
    print("Intergenic")
    best_genic <- best_df[best_df$isBest == 1 & best_df$type == "genic",]
    if( nrow(best_genic) == 0 ){
      best_genic <- Input_matrix[Input_matrix$type == "genic",]
    }
    Genic <- rbind(Genic, best_genic)
  }
  return(Genic)
}




# f.Find.antisense.multiple.genes <- function(Input_matrix){
#   
#   Input_matrix <- as.data.frame(Input_matrix)
#   Antisense <- c(); TMP_final <- c(); Final_value <- c() #Declare initial variables
#   
#   if(length(unique(Input_matrix[,4])) == 1){ 
#     
#     Antisense <- Input_matrix[1,] #If the gene repeats several times grab the first one
#     
#   }  else{
#     
#     unique_values <- unique(Input_matrix[,4]) #If not grab the unique mRNA pairs
#     
#     for(i in 1:length(unique_values)){
#       
#       tmp <- Input_matrix[Input_matrix[,4] == unique_values[i],][1,]
#       TMP_final <- rbind(TMP_final, tmp)
#       
#     }
#   }
#   
#   Final_value <- rbind(Antisense, TMP_final)
#   return(as.data.frame(Final_value))
#   
# }