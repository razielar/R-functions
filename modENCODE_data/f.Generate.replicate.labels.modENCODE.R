############################ Generate the modENCODE labels
######## August 20th 2019 


######## 1) Generate the development labels 

f.generate.modENCODE.labels <- function(Input_matrix){
  
  Input_matrix <- as.data.frame(Input_matrix)
  Input_matrix$Replicate_Sample <- NA
  
  for(i in 1:nrow(Input_matrix)){
    Input_matrix[i,2] <- paste(Input_matrix[i,1], i, sep=".")
    
  }
  
  return(as.data.frame(Input_matrix))
}

#### --- Usage: 
# tmp_labesl <- labels_samples %>% group_by(Generic_Samples) %>% 
#   do(f.generate.modENCODE.labels(.)) %>% as.data.frame()







