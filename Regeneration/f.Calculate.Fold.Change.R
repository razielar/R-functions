##### Calculate Fold change Funcitons:

########### 1.1) Calculate Fold change:
### October 14th 2019
### Instructions:
# The input matrix MUST have the following order:
## "Control-0h" "Regeneration-0h" "Control-15h" "Regeneration-15h"
## "Control-25h" "Regeneration-25h"
## R_script: /nfs/users2/rg/ramador/D_me/RNA-seq/DGE_reanalysis/dme_r6.29/R_scripts/Fold.change.TPM.Comparison.R

f.FoldChange <- function(input_matrix, psuedo_count=0.0000001){

    require(gtools, dplyr)

    psuedo_count <- psuedo_count
    
    output <- data.frame(matrix(nrow=nrow(input_matrix), ncol=12))
    rownames(output) <- rownames(input_matrix)
    colnames(output) <- c(colnames(input_matrix)[1:2],
                          "FoldChange_0h","FoldChange_0h_group",
                          colnames(input_matrix)[3:4],
                          "FoldChange_15h","FoldChange_15h_group",
                          colnames(input_matrix)[5:6],
                          "FoldChange_25h","FoldChange_25h_group" )    
    
    for(i in 1:nrow(input_matrix)){

        if(input_matrix[i,1] == 0.00){
            input_matrix[i,1] <- psuedo_count
        }
        if(input_matrix[i,2] == 0.00){
            input_matrix[i,2] <- psuedo_count
        }
        if(input_matrix[i,3] == 0.00){
            input_matrix[i,3] <- psuedo_count
        }
        if(input_matrix[i,4] == 0.00){
            input_matrix[i,4] <- psuedo_count
        }
        if(input_matrix[i,5] == 0.00){
            input_matrix[i,5] <- psuedo_count
        }
        if(input_matrix[i,6] == 0.00){
            input_matrix[i,6] <- psuedo_count
        }

        fold_early <- foldchange(input_matrix[i,2],input_matrix[i,1])
        fold_mild <- foldchange(input_matrix[i,4],input_matrix[i,3])
        fold_late <- foldchange(input_matrix[i,6],input_matrix[i,5])
        
        output[i,3] <- fold_early %>% round(., digits = 3)
        output[i,7] <- fold_mild %>% round(., digits = 3)
        output[i,11] <- fold_late %>% round(., digits = 3)

        if(is.finite(fold_early) && fold_early >= 1.69){
            output[i,4] <- "upregulated"
        } else if(is.finite(fold_early) && fold_early <= -1.69){
            output[i,4] <- "downregulated"
        } else{
            output[i,4] <- "flat"
        }

        if(is.finite(fold_mild) && fold_mild >= 1.69){
            output[i,8] <- "upregulated"
        } else if(is.finite(fold_mild) && fold_mild <= -1.69){
            output[i,8] <- "downregulated"
        } else{
            output[i,8] <- "flat"
        } 

        if(is.finite(fold_late) && fold_late >= 1.69){
            output[i,12] <- "upregulated"
        } else if(is.finite(fold_late) && fold_late <= -1.69){
            output[i,12] <- "downregulated"
        } else{
            output[i,12] <- "flat"
        }           
    }

    output[,1] <- input_matrix[,1] %>% round(., digits = 3)
    output[,2] <- input_matrix[,2] %>% round(., digits = 3)
    output[,5] <- input_matrix[,3] %>% round(., digits = 3)
    output[,6] <- input_matrix[,4] %>% round(., digits = 3)
    output[,9] <- input_matrix[,5] %>% round(., digits = 3)
    output[,10] <- input_matrix[,6] %>% round(., digits = 3)

    return(output)
}

### Usage: 
## tmp <-  f.FoldChange(input_matrix = expression)

########### 1.2) Calculate Fold change:
### October 17th 2019
### Description:
# In order to avoid biases we added 1 to all the samples to calculate the FoldChange
# in all the ranges from 0 to <1 TPMs 
### Instructions:
# The input matrix MUST have the following order:
# "Control-0h" "Regeneration-0h" "Control-15h" "Regeneration-15h"
# "Control-25h" "Regeneration-25h"
### R_script: /nfs/users2/rg/ramador/D_me/RNA-seq/DGE_reanalysis/dme_r6.29/R_scripts/Fold.change.TPM.add.1.comparison.R

f.FoldChange.AddOne <- function(input_matrix){

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

        fold_early <- foldchange(input_matrix[i,2]+1,input_matrix[i,1]+1)
        fold_mild <- foldchange(input_matrix[i,4]+1,input_matrix[i,3]+1)
        fold_late <- foldchange(input_matrix[i,6]+1,input_matrix[i,5]+1)

        output[i,3] <- fold_early %>% round(., digits = 3)
        output[i,7] <- fold_mild %>% round(., digits = 3)
        output[i,11] <- fold_late %>% round(., digits = 3)

        if(fold_early >= 1.69){
            output[i,4] <- "upregulated"
        } else if(fold_early <= -1.69){
            output[i,4] <- "downregulated"
        } else{
            output[i,4] <- "flat"
        }

        if(fold_mild >= 1.69){
            output[i,8] <- "upregulated"
        } else if(fold_mild <= -1.69){
            output[i,8] <- "downregulated"
        } else{
            output[i,8] <- "flat"
        } 

        if(fold_late >= 1.69){
            output[i,12] <- "upregulated"
        } else if(fold_late <= -1.69){
            output[i,12] <- "downregulated"
        } else{
            output[i,12] <- "flat"
        }           
    }

    output[,1] <- input_matrix[,1] %>% round(., digits = 3)
    output[,2] <- input_matrix[,2] %>% round(., digits = 3)
    output[,5] <- input_matrix[,3] %>% round(., digits = 3)
    output[,6] <- input_matrix[,4] %>% round(., digits = 3)
    output[,9] <- input_matrix[,5] %>% round(., digits = 3)
    output[,10] <- input_matrix[,6] %>% round(., digits = 3)

    return(output)
}

### Usage:
## tmp <- f.FoldChange.AddOne(input_matrix = expression)


########### 2) Function to get ride of low expressed genes labeled as DGE
### October 15th 2019
### Instructions: Input matrix must have the following order:
## [1] "Gene_Name"                      "Gene_Type"                     
##  [3] "Control-0h"                     "Regeneration-0h"               
##  [5] "FoldChange_0h"                  "FoldChange_0h_group"           
##  [7] "Previous-0h_fold_change"        "Previous-0h_group_fold_change" 
##  [9] "Control-15h"                    "Regeneration-15h"              
## [11] "FoldChange_15h"                 "FoldChange_15h_group"          
## [13] "Previous-15h_fold_change"       "Previous-15h_group_fold_change"
## [15] "Control-25h"                    "Regeneration-25h"              
## [17] "FoldChange_25h"                 "FoldChange_25h_group"          
## [19] "Previous-25h_fold_change"       "Previous-25h_group_fold_change"

## ## R_script: /nfs/users2/rg/ramador/D_me/RNA-seq/DGE_reanalysis/dme_r6.29/R_scripts/Fold.change.TPM.Comparison.R

f.Remove_low_expressed <- function(input){

    for(i in 1:nrow(input)){
        ## cat(i, "\n")
        ### 0h 
        if(input[i,6] != "flat" ){
            type <- input[i,6]
            control <- input[i,3]
            reg <- input[i,4]
            if(control >= 1 || reg >= 1){
                input[i,6] <- type
            } else{
                input[i,6] <- "flat"
            }
        }
        ### 15h
        if(input[i,12] != "flat" ){
            type <- input[i,12]
            control <- input[i,9]
            reg <- input[i,10]
            if(control >= 1 || reg >= 1){
                input[i,12] <- type
            } else{
                input[i,12] <- "flat"
            }
        }
        ### 25h
        if(input[i,18] != "flat" ){
            type <- input[i,18]
            control <- input[i,15]
            reg <- input[i,16]
            if(control >= 1 || reg >= 1){
                input[i,18] <- type
            } else{
                input[i,18] <- "flat"
            }
        }

    }

    return(input)
}

### Usage: 
## cutoff <- f.Remove_low_expressed(input = tmp )


