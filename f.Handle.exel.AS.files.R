################### Function to handle Google drive AS 

library(dplyr)

f.Handle_drive.file <- function(Input_matrix){
  
  Colnames <- Input_matrix[2,] %>% as.character()
  
  remove_labels <- grep("Gene", Input_matrix[,1])
  
  Input_matrix <- Input_matrix[-c(remove_labels),]
  
  rownames(Input_matrix) <- 1:nrow(Input_matrix)
  
  Labels <- Input_matrix[grep("^[[:digit:]]", Input_matrix[,1]),][,1] %>% trimws()

  number_labels <- Labels %>% strsplit(., split= " ", fixed= TRUE) %>%
    lapply(., function(x){y <- x[1]}) %>% unlist() %>% as.numeric()

  Final_label <- c()

  for(i in 1:length(Labels)){

    tmp_label <- rep(Labels[i], number_labels[i])
    Final_label <- c(Final_label, tmp_label)

  }

  Input_matrix <- Input_matrix[-c(grep("^[[:digit:]]", Input_matrix[,1])),]
  colnames(Input_matrix) <- Colnames

  Input_matrix$Type <- Final_label

  rownames(Input_matrix) <- 1:nrow(Input_matrix)
  
  return(Input_matrix)
  
  
}

















