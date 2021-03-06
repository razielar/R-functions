################## Function to collapse replicates by mean or other things like median 

### --- 1) Remove replicates: 'Control-0h-R2' & 'Regeneration-15h-R2'
f.Collapse_replicates_by.mean.Remove.2replicates <- function(Input_matrix){
  require(dplyr)
  require(stringr)
  require(magrittr)
  
  col_names <- colnames(Input_matrix)
  value <- all(str_detect(col_names, ".")) #Detect if has a dot insted of hyphen
  #If it's true change hyphens for dots
  if(value){
    col_names %<>% strsplit(., split=".", fixed=TRUE) %>%
      lapply(., function(x){y <- x[1:4]; paste(y, collapse="-")}) %>% 
      unlist()
  } else{ col_names <- col_names }
  
  colnames(Input_matrix) <- col_names
  
  new_colnames <- colnames(Input_matrix) %>%
    strsplit(., split="-", fixed=TRUE) %>%
    lapply(., function(x){y <- x[c(1,2)]; paste(y, collapse="-")}) %>% unlist()
  
  number_columns <- unique(new_colnames) %>% length()
  
  New_df <- data.frame(matrix(nrow = nrow(Input_matrix), ncol = number_columns))
  colnames(New_df) <- new_colnames %>% unique()
  
  New_df[,1] <- Input_matrix[,1]
  New_df[,2] <- Input_matrix[,3]
  New_df[,3] <- apply(Input_matrix[,c(5:6)], 1, mean) %>% round(., digits=2)
  New_df[,4] <- apply(Input_matrix[,c(7:8)], 1, mean) %>% round(., digits=2)
  New_df[,5] <- apply(Input_matrix[,c(9:10)], 1, mean) %>% round(., digits=2)
  New_df[,6] <- apply(Input_matrix[,c(11:12)], 1, mean) %>% round(., digits=2)
  
  rownames(New_df) <- rownames(Input_matrix)
  
  return(New_df)
  
}

### ---2) Remove the replicate: 'Control-0h-R2'
f.Collapse_replicates_by.mean.Remove.ONE.replicates <- function(Input_matrix){
  require(dplyr)
  require(stringr)
  require(magrittr)
  
  col_names <- colnames(Input_matrix)
  value <- all(str_detect(col_names, ".")) #Detect if has a dot insted of hyphen
  #If it's true change hyphens for dots
  if(value){
    col_names %<>% strsplit(., split=".", fixed=TRUE) %>%
      lapply(., function(x){y <- x[1:4]; paste(y, collapse="-")}) %>% 
      unlist()
  } else{ col_names <- col_names }
  
  colnames(Input_matrix) <- col_names

  new_colnames <- colnames(Input_matrix) %>%
    strsplit(., split="-", fixed=TRUE) %>%
    lapply(., function(x){y <- x[c(1,2)]; paste(y, collapse="-")}) %>% unlist()

  number_columns <- unique(new_colnames) %>% length()

  New_df <- data.frame(matrix(nrow = nrow(Input_matrix), ncol = number_columns))
  colnames(New_df) <- new_colnames %>% unique()

  New_df[,1] <- Input_matrix[,1]
  New_df[,2] <- apply(Input_matrix[,c(3:4)], 1, mean) %>% round(., digits=2)
  New_df[,3] <- apply(Input_matrix[,c(5:6)], 1, mean) %>% round(., digits=2)
  New_df[,4] <- apply(Input_matrix[,c(7:8)], 1, mean) %>% round(., digits=2)
  New_df[,5] <- apply(Input_matrix[,c(9:10)], 1, mean) %>% round(., digits=2)
  New_df[,6] <- apply(Input_matrix[,c(11:12)], 1, mean) %>% round(., digits=2)

  rownames(New_df) <- rownames(Input_matrix)

  return(New_df)
  
}


### Usage: 

# f.Collapse_replicates_by.mean.Remove.2replicates(regeneration)
# f.Collapse_replicates_by.mean.Remove.ONE.replicates(regeneration) 

### ---3) Remove the replicate: 'Control-0h-R2' and collapse by mean L3 replicates:
f.Collapse_replicates_L3_by.mean.Remove.ONE.replicates <- function(Input_matrix){

    require(tidyverse)
    require(magrittr)
    
    col_names <- colnames(Input_matrix)
    value <- all(str_detect(col_names, ".")) #Detect if has a dot insted of hyphen
    #If it's true change hyphens for dots
    if(value){
        col_names %<>% strsplit(., split=".", fixed=TRUE) %>%
            lapply(., function(x){y <- x[1:4]; paste(y, collapse="-")}) %>% 
            unlist()
    } else{ col_names <- col_names }
    
    colnames(Input_matrix) <- col_names

    first_colnames <- colnames(Input_matrix)[1:2] %>%
        strsplit(., split = "-", fixed = TRUE) %>%
        lapply(., function(x){y <- x[c(1)]}) %>% unlist()

    second_colnames <- colnames(Input_matrix)[3:ncol(Input_matrix)] %>%
        strsplit(., split="-", fixed=TRUE) %>%
        lapply(., function(x){y <- x[c(1,2)]; paste(y, collapse="-")}) %>% unlist()

    new_colnames <- c(first_colnames,second_colnames)

    number_columns <- unique(new_colnames) %>% length()

    New_df <- data.frame(matrix(nrow = nrow(Input_matrix), ncol = number_columns))
    colnames(New_df) <- new_colnames %>% unique()

    New_df[,1] <- apply(Input_matrix[,c(1:2)], 1, mean) %>% round(., digits=2)
    New_df[,2] <- Input_matrix[,3]
    New_df[,3] <- apply(Input_matrix[,c(5:6)], 1, mean) %>% round(., digits=2)
    New_df[,4] <- apply(Input_matrix[,c(7:8)], 1, mean) %>% round(., digits=2)
    New_df[,5] <- apply(Input_matrix[,c(9:10)], 1, mean) %>% round(., digits=2)
    New_df[,6] <- apply(Input_matrix[,c(11:12)], 1, mean) %>% round(., digits=2)
    New_df[,7] <- apply(Input_matrix[,c(13:14)], 1, mean) %>% round(., digits=2)

    rownames(New_df) <- rownames(Input_matrix)

    return(New_df)
  
}

### Colnames and order of the input df:

## [1] "L3-R1-India"               "L3-R2-India"              
## [3] "Control-0h-R1-India"       "Control-0h-R2-India"      
## [5] "Regeneration-0h-R1-India"  "Regeneration-0h-R2-India" 
## [7] "Control-15h-R1-India"      "Control-15h-R2-India"     
## [9] "Regeneration-15h-R1-India" "Regeneration-15h-R2-India"
## [11] "Control-25h-R1-India"      "Control-25h-R2-India"     
## [13] "Regeneration-25h-R1-India" "Regeneration-25h-R2-India"

### Usage: 
## f.Collapse_replicates_L3_by.mean.Remove.ONE.replicates(Input_matrix = input) 




