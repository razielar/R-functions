######################## Function to produce Correlation_plots 
##### November 5th 2018 
##### Libraries: 

options(stringsAsFactors = FALSE)
library(dplyr)
library(ggplot2)
library(ggpubr)

############# Plot by Time_point and Control & Regeneration: multiple colors

f.Plot_Cor_mRNA.lncRNA_Time.point <- function(Input_matrix, label= "Antisense_India_all.replicates", 
                                              Gene.expression_matrix){
  
  tmp_label <- Input_matrix[,9] %>% strsplit(., split="_", fixed = TRUE) %>% 
    lapply(., function(x){y <- x[c(1:3)]; paste0(y, collapse = "_")}) %>% unlist() 
  
  tmp_label <- tmp_label[tmp_label == label] %>% unique()
  
  tmp_Input_matrix <- Input_matrix[grep(tmp_label, Input_matrix[,9]),]
  
  for(i in 1:nrow(tmp_Input_matrix)){

    cat(i, "\n")

    expression_tmp <- Gene.expression_matrix[rownames(Gene.expression_matrix) == tmp_Input_matrix[i,10] |
                                               rownames(Gene.expression_matrix) == tmp_Input_matrix[i,11] ,]

    expression_tmp <- log10(expression_tmp+1) %>% t()

    Treatment <- rownames(expression_tmp) %>% strsplit(., split="-", fixed=TRUE) %>%
      lapply(., function(x){y <- x[c(1,2)]; paste0(y,collapse = "-") }) %>% unlist()

    rownames(expression_tmp) <- 1:nrow(expression_tmp)
    expression_tmp <- data.frame(expression_tmp)
    expression_tmp["Treatment"] <- Treatment

    y <- tmp_Input_matrix[i,1] %>% as.character()
    x <- tmp_Input_matrix[i,2] %>% as.character()
    y_lab <- paste0("mRNA: ", y, "  [log10(TPM+1)]")
    x_lab <- paste0("lncRNA: ", x, "  [log10(TPM+1)]")

    this_plot <- ggscatter(data.frame(expression_tmp), x= tmp_Input_matrix[i,10], y= tmp_Input_matrix[i,11],
                           add = "reg.line", conf.int = FALSE,
              xlab = x_lab , ylab = y_lab,
              cor.method = "pearson", cor.coef = TRUE)+
      theme(axis.text.y = element_text(face = "bold"),
            text = element_text(size=18, face = "bold"),
            axis.text.x = element_text(face = "bold"),
            axis.title.y = element_text(face="bold") )+geom_point(size=5, aes(color=Treatment))

    plot(this_plot)

  }

  dev.off()
  
}

############# Plot by Control or Regeneration: 2 colors

f.Plot_Cor_mRNA.lncRNA_Control.Regeneration <- function(Input_matrix, label= "Antisense_India_all.replicates", 
                                              Gene.expression_matrix){
  
  tmp_label <- Input_matrix[,9] %>% strsplit(., split="_", fixed = TRUE) %>% 
    lapply(., function(x){y <- x[c(1:3)]; paste0(y, collapse = "_")}) %>% unlist() 
  
  tmp_label <<- tmp_label[tmp_label == label] %>% unique()
  
  tmp_Input_matrix <<- Input_matrix[grep(tmp_label, Input_matrix[,9]),]
  
  for(i in 1:nrow(tmp_Input_matrix)){
    
    cat(i, "\n")
    
    expression_tmp <- Gene.expression_matrix[rownames(Gene.expression_matrix) == tmp_Input_matrix[i,10] |
                                               rownames(Gene.expression_matrix) == tmp_Input_matrix[i,11] ,]
    
    expression_tmp <- log10(expression_tmp+1) %>% t()
    
    Treatment <- rownames(expression_tmp) %>% strsplit(., split="-", fixed=TRUE) %>%
      lapply(., function(x){y <- x[1]}) %>% unlist()
    
    Time_Point <- rownames(expression_tmp) %>% strsplit(., split="-", fixed=TRUE) %>%
      lapply(., function(x){y <- x[2]}) %>% unlist()
    
    rownames(expression_tmp) <- 1:nrow(expression_tmp)
    expression_tmp <- data.frame(expression_tmp)
    expression_tmp["Treatment"] <- Treatment
    expression_tmp["Time_Point"] <- Time_Point
    
    y <- tmp_Input_matrix[i,1] %>% as.character()
    x <- tmp_Input_matrix[i,2] %>% as.character()
    y_lab <- paste0("mRNA: ", y, "  [log10(TPM+1)]")
    x_lab <- paste0("lncRNA: ", x, "  [log10(TPM+1)]")
    
    this_plot <- ggscatter(data.frame(expression_tmp), x= tmp_Input_matrix[i,10], y= tmp_Input_matrix[i,11],
                           add = "reg.line", conf.int = FALSE,
                           xlab = x_lab , ylab = y_lab,
                           cor.method = "pearson", cor.coef = TRUE)+
      theme(axis.text.y = element_text(face = "bold"),
            text = element_text(size=18, face = "bold"),
            axis.text.x = element_text(face = "bold"),
            axis.title.y = element_text(face="bold") )+geom_point(size=5, aes(color=Treatment, shape=Time_Point))+
      scale_color_manual(values = c("olivedrab", "orange2"))

    plot(this_plot)
    
  }
  
  dev.off()
  
}


f.Plot_Cor_Simple.Case_mRNA.lncRNA_Control.Regeneration <- function(Input_matrix, Gene.expression_matrix){
  
  options(stringsAsFactors = FALSE)
  library(dplyr)
  library(ggplot2)
  library(ggpubr)
  
  
  tmp_Input_matrix <- as.data.frame(Input_matrix)
  
  for(i in 1:nrow(tmp_Input_matrix)){
    
    cat(i, "\n")
    
    #Column 9: lncRNA_ID; USES IDs
    #Column 10: mRNA_ID; USES IDs
    
    expression_tmp <- Gene.expression_matrix[rownames(Gene.expression_matrix) == tmp_Input_matrix[i,9] |
                                               rownames(Gene.expression_matrix) == tmp_Input_matrix[i,10] ,]
    
    expression_tmp <- expression_tmp %>% t()
    
    Treatment <- rownames(expression_tmp) %>% strsplit(., split="-", fixed=TRUE) %>%
      lapply(., function(x){y <- x[1]}) %>% unlist()
    
    Time_Point <- rownames(expression_tmp) %>% strsplit(., split="-", fixed=TRUE) %>%
      lapply(., function(x){y <- x[2]}) %>% unlist()
    
    rownames(expression_tmp) <- 1:nrow(expression_tmp)
    expression_tmp <- data.frame(expression_tmp)
    expression_tmp["Treatment"] <- Treatment
    expression_tmp["Time_Point"] <- Time_Point
    
    y <- tmp_Input_matrix[i,1] %>% as.character()
    x <- tmp_Input_matrix[i,2] %>% as.character()
    y_lab <- paste0("mRNA: ", y, "  [log10(TPM+1)]")
    x_lab <- paste0("lncRNA: ", x, "  [log10(TPM+1)]")
    
    this_plot <- ggscatter(data.frame(expression_tmp), x= tmp_Input_matrix[i,9], y= tmp_Input_matrix[i,10],
                           add = "reg.line", conf.int = FALSE,
                           xlab = x_lab , ylab = y_lab,
                           cor.method = "pearson", cor.coef = TRUE)+
      theme(axis.text.y = element_text(face = "bold"),
            text = element_text(size=18, face = "bold"),
            axis.text.x = element_text(face = "bold"),
            axis.title.y = element_text(face="bold") )+geom_point(size=5, aes(color=Treatment, shape=Time_Point))+
      scale_color_manual(values = c("olivedrab", "orange2"))
    
    plot(this_plot)
    
  }
  
  dev.off()
  
}


