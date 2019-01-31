###################### FEELnc change IDs to Gene or Transcript names 

### Input_matrix = output of FEELnc 
### lncRNA_matrix = Gene_ID, Gene_Name, Transcript_ID and Transcript_Name of lncRNAs
### mRNA_matrix = the as above but for mRNAs

### Auxiliary function: 
f.Mapping.IDs <- function(Input_matrix, lncRNA_matrix, mRNA_matrix){
  
  require(dplyr)
  
  Input_matrix <- as.data.frame(Input_matrix) #Very importat otherwise it crashs! 
  
  a <- lncRNA_matrix[lncRNA_matrix$Transcript_ID == unique(Input_matrix$lncRNA_transcript) ,][,2]
  b <- lncRNA_matrix[lncRNA_matrix$Transcript_ID == unique(Input_matrix$lncRNA_transcript) ,][,4]
  Input_matrix[,2] <- a  #Gene_Name lncRNA
  Input_matrix[,3] <- b  #Transcript_Name lncRNA
  
  for(i in 1:nrow(Input_matrix)){
    
    c <- mRNA_matrix[mRNA_matrix$Transcript_ID == Input_matrix[i,5],][,3]
    d <- mRNA_matrix[mRNA_matrix$Transcript_ID == Input_matrix[i,5],][,4]
    Input_matrix[i,4] <- c #Gene_Name mRNA
    Input_matrix[i,5] <- d #Transcript_Name mRNA
    
  }
  
  return(as.data.frame(Input_matrix))
  
}

### Main function
f.Change_IDs_Names <- function(Input_matrix){
  
  Result_matrix <- Input_matrix %>% group_by(lncRNA_transcript) %>%
    do( f.Mapping.IDs(., lncRNA_matrix = Gene_lnRNA.description, mRNA_matrix = Gene_mRNA.description)  ) %>%
    as.data.frame()

  return(Result_matrix)
  
}




























