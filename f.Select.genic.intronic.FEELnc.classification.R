




f.Find.antisense.multiple.genes <- function(Input_matrix){
  
  Input_matrix <- as.data.frame(Input_matrix)
  Antisense <- c(); TMP_final <- c(); Final_value <- c() #Declare initial variables
  
  if(length(unique(Input_matrix[,4])) == 1){ 
    
    Antisense <- Input_matrix[1,] #If the gene repeats several times grab the first one
    
  }  else{
    
    unique_values <- unique(Input_matrix[,4]) #If not grab the unique mRNA pairs
    
    for(i in 1:length(unique_values)){
      
      tmp <- Input_matrix[Input_matrix[,4] == unique_values[i],][1,]
      TMP_final <- rbind(TMP_final, tmp)
      
    }
  }
  
  Final_value <- rbind(Antisense, TMP_final)
  return(as.data.frame(Final_value))
  
}