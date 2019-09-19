######### Function to create the df for plot the Aggregation plots for ATAC-seq
### September 5th 
### The df comes from bwtool aggregation 

### 1) Plot Control and Regeneration together either by control or regeneration
     #Obtaining 2 behaviors per plot
f.plot.ATAC.seq <- function(input_matrx){
  
  require(reshape2)
  colnames(input_matrx)[2:3] <- c("Control", "Regeneration")
  
  df_plot <- melt(input_matrx, id="Position")
  
  return(df_plot)
  
}

### Usage: 
# intronic_genic <- f.plot.ATAC.seq(input_matrx = intronic_genic)

### Plot: 
# ggplot(data = intronic_genic, aes(x=Position, y=value, color=variable))+
#   geom_line()+ggtitle("ATAC-seq: genic-intronic (7) upregulated at 0h")+
#   ylab("ATAC-seq Read Density at 0h")+xlab("")+
#   scale_color_manual(values = c("chartreuse4", "orange2"))+
#   theme(plot.title = element_text(hjust = 0.5, face = "bold"), 
#         axis.text.y = element_text(face = "bold"),
#         axis.text.x = element_text(face = "bold"), 
#         text = element_text(size=10, face = "bold"),
#         legend.title = element_text(color = "white"))


### 2) Plot 4 behaviors: Regeneration: up and downregulated & Control: up and donwregulation

f.4.plots <- function(input_upregulated, input_downregulated){
  
  tmp_1 <- f.plot.ATAC.seq(input_matrx = input_upregulated)
  tmp_2 <- f.plot.ATAC.seq(input_matrx = input_downregulated)
  
  tmp_1$DGE <- rep("Upregulated", nrow(tmp_1))
  tmp_2$DGE <- rep("Downregulated", nrow(tmp_2))
  
  tmp <- rbind(tmp_1, tmp_2)
  
  tmp$DGE <- as.factor(tmp$DGE)
  tmp$DGE <- factor(tmp$DGE, 
                    levels = levels(tmp$DGE)[c(2,1)]) 
  tmp$variable <- as.factor(tmp$variable)
  tmp$variable <- factor(tmp$variable, 
                         levels = levels(tmp$variable)[c(2,1)]) 
  return(tmp)
}

### Usage: 

# mRNA_4 <- f.4.plots(input_upregulated = mRNA_up, input_downregulated = mRNA_down)

### --- Plot: 

# ggplot(data = mRNA_4, aes(x=Position, y=value, color=DGE, linetype=variable))+
#   geom_line()+ggtitle("ATAC-seq: mRNAs")+ylab("ATAC-seq Read Density at 0h")+xlab("")+
#   scale_color_manual(values = c("firebrick2", "dodgerblue2"))+
#   theme(plot.title = element_text(hjust = 0.5, face = "bold"), 
#         axis.text.y = element_text(face = "bold"),
#         axis.text.x = element_text(face = "bold"), 
#         text = element_text(size=10, face = "bold"),
#         legend.title = element_text(color = "white"))

### 3) Plot 6 behaviors: Regeneration: up, downregulated and flat & Control: up, down, flat

f.6.plots <- function(input_upregulated, input_downregulated, input_flat){
  
  tmp_1 <- f.plot.ATAC.seq(input_matrx = input_upregulated)
  tmp_2 <- f.plot.ATAC.seq(input_matrx = input_downregulated)
  tmp_3 <- f.plot.ATAC.seq(input_matrx = input_flat)
  
  tmp_1$DGE <- rep("Upregulated", nrow(tmp_1))
  tmp_2$DGE <- rep("Downregulated", nrow(tmp_2))
  tmp_3$DGE <- rep("Flat", nrow(tmp_3))
  
  tmp <- rbind(tmp_1, tmp_2, tmp_3)
  
  tmp$DGE <- as.factor(tmp$DGE)
  tmp$DGE <- factor(tmp$DGE,
                    levels = levels(tmp$DGE)[c(3,1,2)])
  tmp$variable <- as.factor(tmp$variable)
  tmp$variable <- factor(tmp$variable, 
                         levels = levels(tmp$variable)[c(2,1,3)]) 
  
  return(tmp)
  
  
  
}

# genic_exonic_up <- read.delim("Aggregate/Agg_lncRNA_genic_exonic/lncRNA.up.regulated.genic.exonic.ATAC.0h.1000.tsv")
# genic_exonic_down <- read.delim("Aggregate/Agg_lncRNA_genic_exonic/lncRNA.down.regulated.genic.exonic.ATAC.0h.1000.tsv")
# genic_exonic_flat <- read.delim("Aggregate/Agg_lncRNA_genic_exonic/lncRNA.flat.genic.exonic.ATAC.0h.1000.tsv")

### --- Usage: 
# trial <- f.6.plots(input_upregulated = genic_exonic_up, input_downregulated = genic_exonic_down,
#           input_flat = genic_exonic_flat)

### --- Ggplot2: 

# gplot(data = genic_exonic_6, aes(x=Position, y=value, color=DGE, linetype=variable))+
#   geom_line()+scale_color_manual(values = c("firebrick2", "dodgerblue2", "gray"))+
#   xlab("")+ylab("ATAC-seq Read Density at 0h")+ggtitle("ATAC-seq: Genic-exonic lncRNAs")+
#   theme(plot.title = element_text(hjust = 0.5, face = "bold"), 
#         axis.text.y = element_text(face = "bold"),
#         axis.text.x = element_text(face = "bold"), 
#         text = element_text(size=10, face = "bold"),
#         legend.title = element_text(color = "white"))


