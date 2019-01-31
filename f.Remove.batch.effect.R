############## This are some functions need for the pipeline to remove the Batch-effect ########################

require(pheatmap)

f.Remove_var <- function(Input_matrix, n_var){
  
  require(dplyr)
  
  var_per_row <- apply(Input_matrix, 1, var) %>% round(4)
  removed_transcripts <- Input_matrix[which(var_per_row <= n_var),]
  cat("The number of transcripts removed are", nrow(removed_transcripts))
  
  Final_output <- Input_matrix[-which(var_per_row <= n_var),]
  Final_output <- log10(Final_output+1) %>% round(4)
  return(Final_output)
  
}


f.Row_labels_location <- function(Input_matrix){
  
  require(dplyr)

  new_names <- colnames(Input_matrix)
  new_names <- strsplit(new_names, split = "-", fixed = TRUE) %>% 
    lapply( function(x){y <- x[length(x)]} ) %>% unlist()
    
  row_labels <- data.frame(Location=new_names)
  rownames(row_labels) <- colnames(Input_matrix)
  return(row_labels)
  
  
}

f.Row_labels_time.point_treatment <- function(Input_matrix){
  
  require(dplyr)
  
  new_names <- colnames(Input_matrix)
  new_names <- strsplit(new_names, split = "-", fixed = TRUE) %>%
    lapply(function(x){ y <- x[c(1,2)]}) %>% unlist()
  
  Time_point <- data.frame(Time_Point= new_names[which(seq_along(new_names) %%2 == 0)])
  Treatment <- data.frame(Treatment= new_names[which(seq_along(new_names) %%2 != 0)] )
  final_row <- cbind(Time_point, Treatment)
  
  rownames(final_row) <- colnames(Input_matrix)
  
  return(final_row)
  
}

f.Batch_batch <- function(Input_matrix){
  
  require(dplyr)
  
  new_names <- colnames(Input_matrix)
  new_names <- strsplit(new_names, split = "-", fixed = TRUE) %>% lapply(function(x){y <- x[length(x)]}) %>%
    unlist()
  batch <- as.factor(new_names)
  return(batch)
  
}

f.Mod.matrix <- function(Input_matrix){
  
  require(dplyr)
  
  new_names <- colnames(Input_matrix)
  new_names <- strsplit(new_names, split = "-", fixed = TRUE) %>%
    lapply(function(x){ y <- x[c(1,2)]}) %>% unlist()
  
  time_point <- as.factor(new_names[which(seq_along(new_names) %%2 == 0)])
  treatment <- as.factor(new_names[which(seq_along(new_names) %%2 != 0)])
  
  mod <- model.matrix(~treatment+time_point)
  
  return(mod)
  
}







