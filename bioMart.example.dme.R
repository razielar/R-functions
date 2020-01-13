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

##############################################################################################
###### Orthologs analysis: Zebra fish, mouse and human 

library(tidyverse)
library(magrittr)
library(biomaRt)
setwd("/users/rg/ramador/D_me/Data/Genes/dm6_r6.29")
options(stringsAsFactors = F)

## information <- listAttributes(mart = mart)
## information$page %>% table
## information %>% filter(page == "homologs") %>% filter(description %in%
##                                                       c("Zebrafish gene stable ID"))

ensembl <- useEnsembl(biomart = "ensembl", 
                      dataset = "dmelanogaster_gene_ensembl",
                      host = "jan2019.archive.ensembl.org")

info <- c("ensembl_gene_id", "external_gene_name", "chromosome_name", "description",
          "drerio_homolog_ensembl_gene","drerio_homolog_associated_gene_name",
          "mmusculus_homolog_ensembl_gene", "mmusculus_homolog_associated_gene_name",
          "hsapiens_homolog_ensembl_gene","hsapiens_homolog_associated_gene_name")

extra_info <- getBM(mart = ensembl, filters = "ensembl_gene_id",
      values = datExpr$Gene_ID,
      attributes = info)

## extra_info$ensembl_gene_id %>% unique %>% length

extra_info %<>%
        arrange(chromosome_name, external_gene_name)


colnames(extra_info)[c(1:3)] <- c("Gene_ID", "Gene_Name", "Chr")
colnames(extra_info) <- colnames(extra_info) %>% str_to_title


prev_info <- read_tsv("bioMaRt//Results//GeneID.Name.Type.Length.Description.GC.tsv")
prev_info %<>% dplyr::select(Gene_id, Gene_biotype) 


## Obtain Gene_biotype:
extra_info %<>% left_join(., prev_info, by = "Gene_id") %>%
    dplyr::select(Gene_id:Description, Gene_biotype,
                  Drerio_homolog_ensembl_gene:Hsapiens_homolog_associated_gene_name) 

extra_info$Description  %<>% strsplit(., " ", fixed = TRUE) %>%
    lapply(., function(x){y <- x[1:length(x)]; paste(y, collapse = "_")}) %>%
    unlist 

## write.table(extra_info, file = "bioMaRt//Results//GeneID.Name.Type.Description.Orthologs.tsv",
##             sep = "\t", quote = F, col.names = T, row.names = F)



