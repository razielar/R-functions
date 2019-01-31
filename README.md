# R-functions

### Content:

1. [Collapse replicates by mean](#mean)
2. [Functions to manage GTF files](#gtf)
3. [Generate time point plot](#time_plot)
4. [Handle excel Alternative Splicing events](#excel)
5. [Pairwise Correlation analysis](#cor)
6. [PCA specific samples](#pca)
7. [Plot Correlation](#plot_cor)
8. [Remove Batch effect](#batch)
9. [tSNE specific samples](#tsne)
10. [FEELnc change IDs to Names](#id_names)

## 1) <a id='mean'></a> Collapse replicates by mean

## 2) <a id='gtf'></a> Functions to manage GTF files

## 3) <a id='time_plot'></a> Generate time point plot

## 4) <a id='excel'></a> Handle exel Alternative Splicing events

## 5) <a id='cor'></a> Pairwise Correlation analysis

## 6) <a id='pca'></a> PCA specific samples

## 7) <a id='plot_cor'></a> Plot Correlation

## 8) <a id='batch'></a> Remove Batch effect

## 9) <a id='tsne'></a> tSNE specific samples

## 10) <a id='id_names'></a> FEELnc change IDs to Names

This function needs 3 inputs: **1)** FEELnc_classification output with *default order* (isBest, lncRNA_gene, lncRNA_transcript, partnerRNA_gene, partnerRNA_transcript,	direction, type, distance, subtype, location) **2)** lncRNA gene description: Gene_ID, Gene_Name, Transcript_ID and Transcript_Name **3)** mRNA genes description: sames as lncRNA.   
