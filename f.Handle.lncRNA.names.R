################################### Function to handle the lncRNAs gene names ######################################
######## October 9th 2018
######## Brief description: 
  # This functions is to handle lncRNAs gene names directly from the GTF file to ensure reproducibility


f.Handle.lncRNA.names <- function(Input_string){
  
  #This functions receive a vector of strings
  
  require(reshape2)
  
  Gene_name <- colsplit(Input_string, ":", c("Type", "Value"))
  
  for(i in 1:ncol(Gene_name)){ Gene_name[,i] <- gsub(" ", "", Gene_name[,i])} #remove white spaces
  
  Final_value <- c()
  
  for(i in 1:nrow(Gene_name)){
    
    if(Gene_name[i,1] == "asRNA" || Gene_name[i,1] == "lncRNA" || Gene_name[i,1] == "7SLRNA" || Gene_name[i,1] == "Su(Ste)"){
      
      value <- Gene_name[i,2]
      
    } else if(Gene_name[i,2] == "RNA" ){ value <- paste(Gene_name[i,1], Gene_name[i,2], sep = ":") } 
    
    else { value <- Gene_name[i,1] }
    
    Final_value <- c(Final_value, value)
    
  }
  
  return(Final_value)
  
}

