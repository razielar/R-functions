####In this analysis we are going to load count expression and annotate the genes
### September 27th 2019 
### Libraries:
library(dplyr)
library(pheatmap)
library(biomaRt)
library(magrittr)
options(stringsAsFactors = F)
setwd("/users/rg/ramador/D_me/RNA-seq/DGE_reanalysis/dme_r6.22/")

### ---Load Expression Data: 
datExpr  <- read.delim("Data//dme_r6.22_Gene.expression_Count_India.txt")

### --- Annotatate Genes:
## listAttributes(mart = mart) %>% View()

### GTF version: r6.22: 2018_03 
### Version: BDGP6.22
mart  <- useMart(biomart = "ENSEMBL_MART_ENSEMBL",
                 dataset = "dmelanogaster_gene_ensembl",
                 host = "apr2018.archive.ensembl.org")



getinfo  <- c("flybase_gene_id","external_gene_name",
              "description","strand", "chromosome_name", "start_position",
              "end_position", "gene_biotype", "percentage_gene_gc_content")
datProbes <- getBM(attributes = getinfo, filters=c("ensembl_gene_id"),
      values= rownames(datExpr),mart=mart) 


