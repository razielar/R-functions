################## Function to collapse replicates by mean or other things like median 

### --- 1) Remove replicates: 'Control-0h-R2' & 'Regeneration-15h-R2'
f.Collapse_replicates_by.mean.Remove.2replicates <- function(Input_matrix){
  
  require(dplyr)
  
  col_names <- colnames(Input_matrix)
  
  new_colnames <- colnames(Input_matrix) %>% 
    strsplit(., split="-", fixed=TRUE) %>%
    lapply(., function(x){y <- x[c(1,2)]; paste(y, collapse="-")}) %>% unlist() 
  
  number_columns <- unique(new_colnames) %>% length()
  
  New_df <- data.frame(matrix(nrow = nrow(Input_matrix), ncol = number_columns))
  colnames(New_df) <- new_colnames %>% unique()
  
  New_df[,1] <- Input_matrix[,1]
  New_df[,4] <- Input_matrix[,6]
  
  New_df[,2] <- apply(Input_matrix[,c(2:3)], 1, mean) %>% round(., digits=2)
  New_df[,3] <- apply(Input_matrix[,c(4:5)], 1, mean) %>% round(., digits=2)
  New_df[,5] <- apply(Input_matrix[,c(7:8)], 1, mean) %>% round(., digits=2)
  New_df[,6] <- apply(Input_matrix[,c(9:10)], 1, mean) %>% round(., digits=2)
  
  rownames(New_df) <- rownames(Input_matrix)
  
  return(New_df)
  
  
}

### ---2) Remove the replicate: 'Control-0h-R2'
f.Collapse_replicates_by.mean.Remove.ONE.replicates <- function(Input_matrix){
  
  col_names <- colnames(Input_matrix)
  
  new_colnames <- colnames(Input_matrix) %>% 
    strsplit(., split="-", fixed=TRUE) %>%
    lapply(., function(x){y <- x[c(1,2)]; paste(y, collapse="-")}) %>% unlist() 
  
  number_columns <- unique(new_colnames) %>% length()
  
  New_df <- data.frame(matrix(nrow = nrow(Input_matrix), ncol = number_columns))
  colnames(New_df) <- new_colnames %>% unique()
  
  New_df[,1] <- Input_matrix[,1]

  New_df[,2] <- apply(Input_matrix[,c(2:3)], 1, mean) %>% round(., digits=2)
  New_df[,3] <- apply(Input_matrix[,c(4:5)], 1, mean) %>% round(., digits=2)
  New_df[,4] <- apply(Input_matrix[,c(6:7)], 1, mean) %>% round(., digits=2)
  New_df[,5] <- apply(Input_matrix[,c(8:9)], 1, mean) %>% round(., digits=2)
  New_df[,6] <- apply(Input_matrix[,c(10:11)], 1, mean) %>% round(., digits=2)
  
  rownames(New_df) <- rownames(Input_matrix)
  
  return(New_df)
  
  
}




