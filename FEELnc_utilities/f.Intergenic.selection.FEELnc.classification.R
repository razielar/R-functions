################# Function to handle intergenic genes from the FEELnc classification module
################# March 19th 2019

### September 17th 2019
### 1) From the raw FEELnc classification select lincRNA that are all classified as intergenic:
f.select_intergenic <- function(Input_matrix){
  
  require(dplyr)
  
  Input_matrix <- as.data.frame(Input_matrix)
  type <- Input_matrix$type
  Intergenic <- NULL
  
  if(length(unique(type)) == 1){
    subtype <- unique(type)
    if(subtype == "intergenic"){
      Intergenic <- rbind(Intergenic,Input_matrix)
    }
  }
  
  return(as.data.frame(Intergenic))
  
}

### --- Usage: 
# only_intergenic <- feelnc_input %>% group_by(lncRNA_gene) %>% 
#   do(f.select_intergenic(.)) %>% as.data.frame()


######### 1) The first function works for select only the ONE with lowest distance between lincRNA and mRNA

f.Intergenic_lowestDistance <- function(Input_matrix){
  
  require(dplyr)
  
  Input_matrix <- as.data.frame(Input_matrix)
  
  if(length(unique(Input_matrix$distance)) == 1){ #If the lincRNA only contain one mRNA pair grab the first one
    
    value <- Input_matrix[1,] #grab the first row
    
  } else {
    
    min_length <- min(Input_matrix$distance)
    gene_name <- Input_matrix[Input_matrix$distance == min_length,][,4]
    
    if(length(unique(gene_name)) == 1){ #If the minimum distance is only one gene take that gene
      
      value <- Input_matrix[Input_matrix$distance == min_length,]
      value <- value[!duplicated(value$partnerRNA_gene),] #If there're more than one minimum distance only grab one
      
    } else{ #If not take the genes with minimum distance; example min 1324 genA & geneB grab both of them
      value <- Input_matrix[Input_matrix$distance == min_length,]
    }
  }
  return(as.data.frame(value))
}





######### 2) The second function works to select all the possible intergenic mates
          ## this means catch all lincRNA-mRNA pairs, selecting the transcript with lowest distance 

f.Grab.all.intergenic <- function(Input_matrix){
  
  require(dplyr)
  
  Input_matrix <- as.data.frame(Input_matrix)
  mRNA_genes <- Input_matrix$partnerRNA_gene %>% unique() #Grab all the mRNAs per lincRNA
  
  if(length(unique(mRNA_genes)) == 1){ #If the lincRNA only contain one mRNA pair grab the first one 
    
    Value <- Input_matrix[1,] #grab the first row
    
  } else{
    
    Value <- NULL
    
    for(i in 1:length(mRNA_genes)){ #If not grab all the lincRNA-mRNA pairs selecting the lowest transcript distance 
      
      value <- Input_matrix[Input_matrix$partnerRNA_gene == mRNA_genes[i] ,]
      distance <- min(value$distance) #minimum transcript distance 
      value <- Input_matrix[Input_matrix$distance == distance,]
      value <- value[!duplicated(value$partnerRNA_gene),] #If there're more than one minimum distance only grab one
      
      Value <- rbind(Value, value)
      
    }
  }
  return(as.data.frame(Value))
}





