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


## You can use different version of ensembl in the page:
## http://www.ensembl.org/info/website/archives/index.html
## Where you can select which archive you want to retrieve in the right part

### Some examples:
## mart  <- useMart(biomart = "ENSEMBL_MART_ENSEMBL",
##                  dataset = "dmelanogaster_gene_ensembl",
##                  host = "apr2018.archive.ensembl.org")

## mart  <- useMart(biomart = "ENSEMBL_MART_ENSEMBL",
##                  dataset = "dmelanogaster_gene_ensembl",
##                  host = "jul2019.archive.ensembl.org")

## mart  <- useMart(biomart = "ENSEMBL_MART_ENSEMBL",
##                  dataset = "dmelanogaster_gene_ensembl",
##                  host = "dec2017.archive.ensembl.org")

#### For catch all Gene_names from vast-tools
#### R-script:
## /nfs/users2/rg/ramador/D_me/RNA-seq/AS_analysis/vast_out/New_analysis/Result_AS.tables/Results_Google_drive/Results/Unique_values/R_Scripts/Add.Gene_ID.DGE.Fold.Change.info.R

## mart  <- useMart(biomart = "ENSEMBL_MART_ENSEMBL",
##                  dataset = "dmelanogaster_gene_ensembl",
##                  host = "aug2017.archive.ensembl.org")

## getinfo  <- c("flybase_gene_id","external_gene_name", "gene_biotype")

## datX0h <- getBM(attributes = getinfo, filters=c("external_gene_name"),
##                    values= X0h$Gene ,mart=mart) 



