##### Calculate Fold change 
### October 14th 2019
### Instructions:
# The input matrix MUST have the following order:
## "Control-0h" "Regeneration-0h" "Control-15h" "Regeneration-15h"
## "Control-25h" "Regeneration-25h"
## R_script: /nfs/users2/rg/ramador/D_me/RNA-seq/DGE_reanalysis/dme_r6.29/R_scripts/Fold.change.TPM.Comparison.R

f.FoldChange <- function(input_matrix){

    require(gtools, dplyr)
    output <- data.frame(matrix(nrow=nrow(input_matrix), ncol=12))
    rownames(output) <- rownames(input_matrix)
    colnames(output) <- c(colnames(input_matrix)[1:2],
                          "FoldChange_0h","FoldChange_0h_group",
                          colnames(input_matrix)[3:4],
                          "FoldChange_15h","FoldChange_15h_group",
                          colnames(input_matrix)[5:6],
                          "FoldChange_25h","FoldChange_25h_group" )    
    
    for(i in 1:nrow(input_matrix)){

        fold_early <- foldchange(input_matrix[i,2],input_matrix[i,1])
        fold_mild <- foldchange(input_matrix[i,4],input_matrix[i,3])
        fold_late <- foldchange(input_matrix[i,6],input_matrix[i,5])
        
        output[i,3] <- fold_early %>% round(., digits = 3)
        output[i,7] <- fold_mild %>% round(., digits = 3)
        output[i,11] <- fold_late %>% round(., digits = 3)

        if(is.finite(fold_early) && fold_early >= 1.7){
            output[i,4] <- "upregulated"
        } else if(is.finite(fold_early) && fold_early <= -1.7){
            output[i,4] <- "downregulated"
        } else{
            output[i,4] <- "flat"
        }

        if(is.finite(fold_mild) && fold_mild >= 1.7){
            output[i,8] <- "upregulated"
        } else if(is.finite(fold_mild) && fold_mild <= -1.7){
            output[i,8] <- "downregulated"
        } else{
            output[i,8] <- "flat"
        } 

        if(is.finite(fold_late) && fold_late >= 1.7){
            output[i,12] <- "upregulated"
        } else if(is.finite(fold_late) && fold_late <= -1.7){
            output[i,12] <- "downregulated"
        } else{
            output[i,12] <- "flat"
        }           
    }

    output[,1] <- input_matrix[,1]
    output[,2] <- input_matrix[,2]
    output[,5] <- input_matrix[,3]
    output[,6] <- input_matrix[,4]
    output[,9] <- input_matrix[,5]
    output[,10] <- input_matrix[,6]

    return(output)
}

### Usage: 
## tmp <-  f.FoldChange(input_matrix = expression)


