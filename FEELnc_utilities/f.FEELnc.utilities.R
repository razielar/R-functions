###################### FEELnc utilities

########### 1) FEELnc change IDs to Gene or Transcript names

### Input_matrix = output of FEELnc. 
    ### Default order
### lncRNA_matrix = Gene_ID, Gene_Name, Transcript_ID and Transcript_Name of lncRNAs
    ### The order must be: Gene_ID, Gene_Name, Transcript_ID, Transcript_Name
### mRNA_matrix = the same as above but for mRNAs
    ### The order must be: Gene_ID, Gene_Name, Transcript_ID, Transcript_Name

### Auxiliary function: 
f.Mapping.IDs <- function(Input_matrix, lncRNA_matrix, mRNA_matrix, ID = FALSE){
  
  require(dplyr)
  
  Input_matrix <- as.data.frame(Input_matrix) #Very importat otherwise it crashs! 
  
  if(ID){
    
    Input_matrix$lncRNA_ID <- Input_matrix[,2] #lncRNA ID
    a <- lncRNA_matrix[lncRNA_matrix[,3] == unique(Input_matrix[,3] ) ,][,2]
    b <- lncRNA_matrix[lncRNA_matrix[,3] == unique(Input_matrix[,3] ) ,][,4]
    Input_matrix[,2] <- a  #Gene_Name lncRNA
    Input_matrix[,3] <- b  #Transcript_Name lncRNA
     
    
    for(i in 1:nrow(Input_matrix)){
      
      c <- mRNA_matrix[mRNA_matrix[,3] == Input_matrix[i,5],][,2]
      d <- mRNA_matrix[mRNA_matrix[,3] == Input_matrix[i,5],][,4]
      Input_matrix[i,4] <- c #Gene_Name mRNA
      Input_matrix[i,5] <- d #Transcript_Name mRNA
      
    }
    
    return(as.data.frame(Input_matrix))
    
    
  } else {
    
    a <- lncRNA_matrix[lncRNA_matrix[,3] == unique(Input_matrix[,3] ) ,][,2]
    b <- lncRNA_matrix[lncRNA_matrix[,3] == unique(Input_matrix[,3] ) ,][,4]
    Input_matrix[,2] <- a  #Gene_Name lncRNA
    Input_matrix[,3] <- b  #Transcript_Name lncRNA
    
    for(i in 1:nrow(Input_matrix)){
      
      c <- mRNA_matrix[mRNA_matrix[,3] == Input_matrix[i,5],][,2]
      d <- mRNA_matrix[mRNA_matrix[,3] == Input_matrix[i,5],][,4]
      Input_matrix[i,4] <- c #Gene_Name mRNA
      Input_matrix[i,5] <- d #Transcript_Name mRNA
      
    }
    
    return(as.data.frame(Input_matrix))
    
  }
  
}


### Main function
f.Change_IDs_Names <- function(Input_matrix, lncRNA_description, mRNA_description, maintain.ID = FALSE){
  
  Result_matrix <- Input_matrix %>% group_by(lncRNA_transcript) %>%
    do( f.Mapping.IDs(., lncRNA_matrix = lncRNA_description, 
                      mRNA_matrix = mRNA_description, ID = maintain.ID )) %>%
    as.data.frame()

  return(Result_matrix)
  
}

########### 2) Obtain the intergenic lncRNAs with the lowest distance with the partner mRNA
            ## and if all have the same distance maintain the first one (this is arbitrary)

f.tmp.Intergenic_lowest <- function(Input_matrix){
  
  require(dplyr)
  
  Input_matrix <- as.data.frame(Input_matrix)
  
  if(length(unique(Input_matrix$distance)) == 1){
    
    value <- Input_matrix[1,] #grab the first row
    
  } else {
    
    min_length <- min(Input_matrix$distance)
    value <- Input_matrix[Input_matrix$distance == min_length,]
    
  }
  
  return(as.data.frame(value))
  
}

f.Intergenic_lowest_distance <- function(Input_matrix){
  
  Result_matrix <- Input_matrix %>% group_by(lncRNA_ID) %>% 
    do( f.tmp.Intergenic_lowest(.) ) %>% as.data.frame()
  
  return(Result_matrix)
  
}


