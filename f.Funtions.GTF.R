

####### Function to manage the attribute part of a GTF file: 

f.Manage.Attribute.gtf <- function(Input_matrix){
  
  require(dplyr)
  require(reshape2)
  
  #Select the attribute column; ncol=9; select only the first 5 fields: Gene_id, Gene_symbol, transcript_id, 
  #transcript_symbol and gene_type
  attribute <- as.character(Input_matrix[,9]) %>% strsplit(., split=";", fixed=TRUE) %>%
    lapply(., function(x){ y <- x[c(1:5)]; trimws(y) }   ) %>% unlist()
  
  attribute <- colsplit(attribute, " ", c("Type", "ID")) %>% select(-Type)
  
  attribute <- matrix(as.character(attribute$ID), ncol = 5, byrow = TRUE) %>% as.data.frame()
  colnames(attribute) <- c("Gene_ID", "Gene_Name", "Transcript_ID", "Transcript_Name", "Gene_Type")
  
  Input_matrix[,9] <- NULL
  Input_matrix <- cbind(Input_matrix, attribute)
  
  return(Input_matrix)
  
  
}

#### Function to identify exons in different sense 
f.Identify_sense_difference_exons <- function(Input_matrix){
  
  require(dplyr)
  
  Input_matrix <- as.data.frame(Input_matrix)
  result <- c()
  DF_exons <- Input_matrix[Input_matrix[,3] == "exon",]
  
  
  if( "+" %in% DF_exons[,7] & "-" %in% DF_exons[,7]){
    
    result <- unique(DF_exons[,10])
    result <- data.frame(ID=result) %>% as.data.frame()
  }
  
  
  return( as.data.frame(result) )
  
}






