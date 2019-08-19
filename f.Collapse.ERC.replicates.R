################# Function to collapse ERC replicates by mean or median


f.Collapse.ERC.replicates <- function(Input_matrix){
  
  require(dplyr)
  
  ### --- Manage the column names: 
  
  col_names <- colnames(Input_matrix)
  
  new_colnames <- colnames(Input_matrix) %>% 
    strsplit(., split=".", fixed=TRUE) %>%
    lapply(., function(x){y <- x[c(1)]; paste(y, collapse="-")}) %>% unlist() 
  
  number_columns <- unique(new_colnames) %>% length()
  
  New_df <- data.frame(matrix(nrow = nrow(Input_matrix), ncol = number_columns))
  colnames(New_df) <- new_colnames %>% unique()
  
  ### --- Collapse replicates by mean or median:
  
  for(i in 1:number_columns){
    j <- i+i-1
    k <- j+1
    New_df[,i] <- apply( Input_matrix[ , c(j,k) ] ,1, mean) %>% round(., digits=2)
  }
  
  rownames(New_df) <- rownames(Input_matrix)
  
  return(New_df)
  
}


f.Collapse.ERC.replicates(Input_matrix = erc_data)

