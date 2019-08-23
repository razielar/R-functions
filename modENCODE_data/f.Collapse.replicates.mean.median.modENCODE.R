######### Function to collapse the modENCODE replicates either by mean or median
#### August 23th 2019

f.Collapse.modENCODE.replicates <- function(Input_matrix, type=c("mean", "median")){
  
  require(dplyr)
  col_names <- colnames(Input_matrix)
  new_colnames <- colnames(Input_matrix) %>% 
    strsplit(., split=".", fixed=TRUE) %>%
    lapply(., function(x){y <- x[1]}) %>% unlist()
  
  number_columns <- unique(new_colnames) %>% length()
  
  New_df <- data.frame(matrix(nrow = nrow(Input_matrix), ncol = number_columns))
  colnames(New_df) <- new_colnames %>% unique()
  
  ### --- Collapse replicates by mean or median: 
  
  for(i in 1:number_columns){
    cat(i, "\n")
    tmp_df <- Input_matrix[,grepl(colnames(New_df)[i], colnames(Input_matrix))]
    
    if(type == "mean"){
      tmp_df <- apply(tmp_df, 1, mean) %>% round(., digits=2)
    } else {
      tmp_df <- apply(tmp_df, 1, median) %>% round(., digits=2)
    }
    New_df[,i] <- tmp_df
  }
  
  rownames(New_df) <- rownames(Input_matrix)
  
  return(New_df)
  
}

#### --- Usage:

# tmp <- f.Collapse.modENCODE.replicates(Input_matrix = expression, type = "mean")
# tmp_2 <- f.Collapse.modENCODE.replicates(Input_matrix = expression, type = "median")


