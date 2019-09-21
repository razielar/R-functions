################## Function to calculate Tau: tissue-specific 

#### Tau: tissue-specific: 
f.Tau <- function(input_matrix){
  
  Tissue_specific <- data.frame(matrix(nrow = nrow(input_matrix), ncol = 3))
  colnames(Tissue_specific) <- c("Gene_ID", "Tau", "Tissue")
  Tissue_specific[,1] <- rownames(input_matrix)
  
  for(i in 1:nrow(input_matrix)){
    x <- input_matrix[i,]
    tissue <- which.max(x) %>% names()
    x <- (1-(x/max(x)))
    res <- sum(x, na.rm = TRUE)
    tau <- res/(length(x)-1)
    Tissue_specific[i,2] <- tau
    Tissue_specific[i,3] <- tissue
  }
  
  return(Tissue_specific)
  
}


