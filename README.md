# R-functions

### Content:

1. [Regeneration: Collapse replicates by mean](#mean)
2. [Functions to manage GTF files](#gtf)
3. [mRNA-lncRNA pair plots](#lncRNAmRNA)
3. [Generate time point plot](#time_plot)
4. [Handle excel Alternative Splicing events](#excel)
5. [Pairwise Correlation analysis](#cor)
6. [PCA specific samples](#pca)
7. [Plot Correlation](#plot_cor)
8. [Remove Batch effect](#batch)
9. [tSNE specific samples](#tsne)
10. [FEELnc utilities](#id_names)
11. [bioMaRt example](#biomart)

## 1) <a id='mean'></a> Collapse replicates by mean
To use the script: *Regeneration/f.Collapse.Regeneration.replicates.by.mean.R* the input matrix has to have the following order otherwise the mean calculations are senseless. Matrix order:

* Control_0h_R1_India
* Control_0h_R2_India
* Regeneration__0h_R1_India
* Regeneration__0h_R2_India
* Control_15h_R1_India
* Control_15h_R2_India
* Regeneration__15h_R1_India
* Regeneration__15h_R2_India
* Control_25h_R1_India
* Control_25h_R2_India
* Regeneration__25h_R1_India
* Regeneration__25h_R2_India

## 2) <a id='gtf'></a> Functions to manage GTF files

## 3) <a id='lncRNAmRNA'></a> mRNA-lncRNA pair plots
Script: *f.lncRNA.mRNA.pair.Generate.plot.R*

Description:

This function needs 2 inputs:
1. Expression matrix (Gene_IDs in rows and Sample_Names in columns)
2. lncRNA-mRNA pais in the following **order**:

| lncRNA_Gene_ID   |     lncRNA_Gene_Name     | mRNA_Gene_ID  |  mRNA_Gene_Name  |
|----------|:-------------:|------:| ------:|
| FBgn0058469 | CR40469 | FBgn0025837 | CG17636 |
| FBgn0266686 | CR45176 | FBgn0036992 | CG11796 |
| FBgn0267913 | CR46194 | FBgn0014184 | Oda |   


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

## 11) <a id='biomart'></a> bioMaRt example using *Dme*: 

Script: *bioMart.example.dme.R*

Description: 

In this script some examples are presented on how to use bioMaRt to retrieve genomic information using *Dme*




