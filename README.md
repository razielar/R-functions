# R-functions

### Content:

1. [Regeneration: Collapse replicates by mean](#mean)
2. [Functions to manage GTF files](#gtf)
3. [Generate time point plot](#time_plot)
4. [Handle excel Alternative Splicing events](#excel)
5. [Pairwise Correlation analysis](#cor)
6. [PCA specific samples](#pca)
7. [Plot Correlation](#plot_cor)
8. [Remove Batch effect](#batch)
9. [tSNE specific samples](#tsne)
10. [FEELnc utilities](#id_names)

## 1) <a id='mean'></a> Collapse replicates by mean
To use the script: *Regeneration/f.Collapse.Regeneration.replicates.by.mean.R* the input matrix has to have the following order otherwise the mean calculations are senseless.
Matrix order:

|    |     Control.0h.R1.India     |  Control.0h.R2.India |  Regeneration.0h.R1.India  | Regeneration.0h.R2.India |
|----------|:-------------:|------:| ------:| ------:|
| Gene_ID | 14.9588 | 0.5367 | 14.9409 |
| Gene_ID | 8.3756 | 1.1523 | 7.0302|



## 2) <a id='gtf'></a> Functions to manage GTF files

## 3) <a id='time_plot'></a> Generate time point plot

## 4) <a id='excel'></a> Handle exel Alternative Splicing events

## 5) <a id='cor'></a> Pairwise Correlation analysis

## 6) <a id='pca'></a> PCA specific samples

## 7) <a id='plot_cor'></a> Plot Correlation

## 8) <a id='batch'></a> Remove Batch effect

## 9) <a id='tsne'></a> tSNE specific samples

## 10) <a id='id_names'></a> FEELnc utilities

### 10.1) Change Gene_ID into Gene_Name

Description:

This function converts FEELnc classification output from gene IDs into gene names (*and transcripts*). By default it doesn't maintain lncRNA IDs (*maintain.ID = FALSE*)

This function needs 3 inputs:

* **1)** FEELnc_classification output with *default order* (isBest, lncRNA_gene, lncRNA_transcript, partnerRNA_gene, partnerRNA_transcript,	direction, type, distance, subtype, location)
* **2)** lncRNA gene description: Gene_ID, Gene_Name, Transcript_ID and Transcript_Name
* **3)** mRNA genes description: sames as lncRNA.  

### 10.2) Obtain lincRNA with lowest distance

Obtain the long intergenic RNA (lincRNA) with the lowest distance with its partner mRNA or another genomic feature (*promoter, etc.*) and if all lincRNA-mRNA pairs have the same distance maintain the first one (this is arbitrary).
