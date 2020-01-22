# Regeneration Project

1. [Gene analysis](#gene)
2. [Metadata](#meta)
3. [Expression Matrices](#expression)
4. [Analysis of replicates: RNA-seq](#replicates)
5. [Differential Gene Expression Matrix](#dge)
6. [Genomic Location of lncRNAs](#location)
7. [LncRNAs with phenotype](#phenotype)
8. [ATAC-seq analysis](#atac)

## Latest df:

**Description**: use the cutoff of 20% of overlapping between genic-exonic and PCGs with mRNA_ID, TPM expression and fold change group (categorical variable). Obtaining a total of **182 DGE lncRNAs**: *109 intergenic*, *36 genic-intronic* and *37 genic_exonic*. Add NA in FoldChange_group (categorical),  and add *0* for FoldChange (numerical) for lncRNAs and mRNAs if they expression is below of 1 TPM in one sample in each time-point. Add GC% of the gene and description (lncRNAs and neighbor mRNAs). <br>
Need to add orthologs analysis of neighbor mRNAs. 

**Location**:/nfs/users2/rg/ramador/D_me/RNA-seq/DGE_reanalysis/dme_r6.29/foldchange/after_cutoff/Results/DGE.lncRNA.india.crg.genomiclocation.124.27.way.all.PCG.pairs.exonic.cutoff.mRNAs.expression.NA.0.tsv

## 1) <a id='gene'></a> Gene analysis:

### 1.1) Gene description:

#### 1.1.1) Regular analysis:

**Description**: this file contains the 16,468 genes in *D.me* using the GTF dm6.r6.29. The information is: Gene_ID, Gene_Name, Gene_Type, Length (gene length), and strand.

**Location**: /nfs/users2/rg/ramador/D_me/Data/Genes/dm6_r6.29/GeneID.Gene_Name.Gene_Type.Length.tsv

#### 1.1.2) BioMaRt analysis: 

**Description**: the first file contains 16,360 genes in *D.me* using *bioMaRt*. The information is: Gene_ID, Gene_Name, Strand, Chr, Length (gene length), Description, Gene_Type, Percentage_gene_gc_content and Length. <br>
The second file is the **Ortholog analysis** and contains: Gene_ID, Gene_Name, Chr, Description, Gene_Type, and orthologs of Zebra fish, mouse (mus musculus) ahd human. 

**Location**: 
/nfs/users2/rg/ramador/D_me/Data/Genes/dm6_r6.29/bioMaRt/Results/GeneID.Name.Type.Length.Description.GC.tsv <br>
/nfs/users2/rg/ramador/D_me/Data/Genes/dm6_r6.29/bioMaRt/Results/GeneID.Name.Type.Description.Orthologs.tsv


### 1.2) Transcript description:

**Description**: this file contains the 33,545 transcripts in *D.me* using the GTF dm6.r6.29. The information is: Gene_ID, Gene_Name, Transcript_ID, Transcript_Name, Gene_Type, Length (transcript length), and strand

**Location**: /nfs/users2/rg/ramador/D_me/Data/Genes/dm6_r6.29/GeneID.Gene_Name.TranscriptID.Transcript_Name.Gene_Type.Length.tsv

## 2) <a id='meta'></a> Metadata:

### 2.1) Metadata India: 

#### 2.1.1) Complete Metada India

**Description**: complete metadata of all available RNA-seq from India. Contains: experiment_ID (link ID from grape-nf to tailor variable name), replicate_id, sample_type (L3, control or regeneration), time-point, tailor_variable_name.

**Location**: <br>
*Table matrix:*  <br>
/nfs/users2/rg/ramador/D_me/RNA-seq/Metadata/dm6_r6.29/Results/Metadata.India.complete.tsv <br>
*R-object:*  <br>
/nfs/users2/rg/ramador/D_me/RNA-seq/Metadata/dm6_r6.29/Results/Metadata.India.complete.RDS <br>

#### 2.1.2) Used time-points Metadata India

**Description**: this is only for India samples and for the 3 time-points. Contains: experiment_ID (link ID from grape-nf to tailor variable name), replicate_id, sample_type (either control or regeneration), time-point, tailor_variable_name.

**Location**:/nfs/users2/rg/ramador/D_me/RNA-seq/Metadata/dm6_r6.29/Data/Metadata.India.0h.15h.25h.rda

### 2.1) Metadata CRG: 

**Description**: CRG samples: labExpId,sampleType, time and Metadata. 

**Location**: 

*Table matrix:*  <br>
/nfs/users2/rg/ramador/D_me/RNA-seq/Metadata/dm6_r6.29/Results/Metadata.CRG.tsv <br> 
*R-object:* <br>
/nfs/users2/rg/ramador/D_me/RNA-seq/Metadata/dm6_r6.29/Results/Metadata.CRG.RDS 



## 3) <a id='expression'></a> Expression Matrices:

### 3.1) Data extracted from Grape-nf pipeline:

#### 3.1.1) Matrix in TPMs:

**Description**: the rows contain the 16,455 genes and the columns the 22 different samples (*India* and *CRG* samples) in regeneration.

**Location**: /nfs/no_backup_isis/rg/ramador/D_me/RNA-seq/grape-nf-dm6-r6.29/expression_matrices/regeneration.GE.TPMs.tsv

#### 3.1.2) Matrix in FPKMs:

**Location**:
/nfs/no_backup_isis/rg/ramador/D_me/RNA-seq/grape-nf-dm6-r6.29/expression_matrices/regeneration.FPKM.tsv

#### 3.1.3) Matrix in Counts:

**Location**:
/nfs/no_backup_isis/rg/ramador/D_me/RNA-seq/grape-nf-dm6-r6.29/expression_matrices/regeneration.Counts.tsv

### 3.2) Processed data:

#### 3.2.1) India samples: All India replicates and expression cutoff

**Description**: this matrix contains **8,458** genes in rows and 14 samples: L3-R1-India, L3-R2-India, Control-0h-R1-India, Control-0h-R2-India, Regeneration-0h-R1-India, Regeneration-0h-R2-India, Control-15h-R1-India, Control-15h-R2-India, Regeneration-15h-R1-India, Regeneration-15h-R2-India, Control-25h-R1-India, Control-25h-R2-India, Regeneration-25h-R1-India, Regeneration-25h-R2-India. <br>
The expression cutoff: keep genes that are higher or equal of 1 TPM in at least one time-point; a.k.a: 2 replicates only taking into account the samples described before. 

**Location**: <br>
*Table matrix* <br>
/nfs/users2/rg/ramador/D_me/RNA-seq/Covariable_analysis/dm6_r6.29/Results/india.GE.TPM.replicates.L3.cutoff.1TPM.tsv <br>
*R-object* <br>
/nfs/users2/rg/ramador/D_me/RNA-seq/Covariable_analysis/dm6_r6.29/Results/india.GE.TPM.replicates.L3.cutoff.1TPM.RDS

#### 3.2.2) India samples: Collapse India replicates by mean and remove bad replicate

**Description**: this matrix contains 16,455 genes in rows and the six samples in columns: Control-0h, Regeneration-0h, Control-15h, Regeneration-15h, Control-25h, Regeneration-25h. Replicates were collapsed by mean and removing the bad replicate: *Control-0h-India-R2*

**Location**: <br>
*Table matrix* <br>
/nfs/users2/rg/ramador/D_me/RNA-seq/Metadata/dm6_r6.29/Results/India.TPMs.collapse.mean.tsv <br>
*R-object* <br>
/nfs/users2/rg/ramador/D_me/RNA-seq/Metadata/dm6_r6.29/Results/India.TPMs.collapse.mean.RDS

#### 3.2.3) CRG samples: with tailor variable name

**Description**: this matrix contains 16,455 genes in rows and four samples in columns: Control-0h-CRG, Regeneration-0h-CRG, Control-25h-CRG, Regeneration-25h-CRG.

**Location**: <br>
*Table matrix* <br>
/nfs/users2/rg/ramador/D_me/RNA-seq/Expression-Matrices/dm6_r6.29/CRG.TPMs.tsv <br>
*R-object* <br>
/nfs/users2/rg/ramador/D_me/RNA-seq/Expression-Matrices/dm6_r6.29/CRG.TPMs.RDS

#### 3.2.4) CRG samples: with tailor variable name and expression cutoff

**Description**: this matrix contains **8,595** genes in rows and four samples in columns: Control-0h-CRG, Regeneration-0h-CRG, Control-25h-CRG, Regeneration-25h-CRG. <br>
Expression cutoff: keep genes that are higher or equal of 1 TPM in at least one replicate. 

**Location**: <br>
*Table matrix* <br>
/nfs/users2/rg/ramador/D_me/RNA-seq/Covariable_analysis/dm6_r6.29/Results/crg.GE.TPM.cutoff.1TPM.tsv <br>
*R-object* <br>
/nfs/users2/rg/ramador/D_me/RNA-seq/Covariable_analysis/dm6_r6.29/Results/crg.GE.TPM.cutoff.1TPM.RDS


## 4) <a id='replicates'></a> Analysis of replicates: RNA-seq

### 4.1) India Replicate analysis:

**Description**: the analysis was based on **8,458** genes. The pdf contains correlation plots of all India replicates [log10(TPM+0.01)], PCA of all repliactes, Z-score to identify the bad replicate: *Control-0h-R2-India*, PCA removing the bad replicate, and boxplot of gene expression of the 8,458 genes [log10(TPM+0.01)]. 

**Location**: /nfs/users2/rg/ramador/D_me/RNA-seq/Covariable_analysis/dm6_r6.29/Plots/All.india.plots.pdf

### 4.2) CRG Replicate analysis:

**Description**: the analysis was based on **8,595** genes. The pdf contains Z-score to identify bad replicates, PCA of all repliactes [log10(TPM+0.01)], and boxplot of gene expression of the 8,595 genes [log10(TPM+0.01)]. 

**Location**: /nfs/users2/rg/ramador/D_me/RNA-seq/Covariable_analysis/dm6_r6.29/Plots/All.crg.plots.pdf

### 4.3) Combine India and CRG replicates;

**Description**: PCA of replicates, correlation plots replicates, Z-score analysis, boxplot replicates, heatmap of pearson correlation. 

**Location**: /users/rg/ramador/D_me/RNA-seq/Covariable_analysis/dm6_r6.29


## 5) <a id='dge'></a> Differential Gene Expression Matrix:

**Description**: this matrix contains **8,455 genes** which **higher or equal of 1 TPM** in one samples (samples are collapsed by mean from replicates). Contains: Gene_ID, Gene_Name, Gene_Type, Expression in TPMs for Control-0h, Regeneration-0h, Control-15h, Regeneration-15h, Control-25h, Regeneration-25h, Fold change group (up, down or flat; categorical variable) in the three time-points and CRG samples; and Fold Change calculation (numeric variable) only for India samples. <br>
Fold change was calculated if there is one gene which is not expressed (or lower then the cutoff) a pseudo-count was used to retain cases in which a lncRNA in one case is expressed more than 1 TPM and in another case not expressed.

**Location**:
/nfs/users2/rg/ramador/D_me/RNA-seq/DGE_reanalysis/dme_r6.29/foldchange/Results/FoldChange.calculation.india.crg.tsv


## 6) <a id='location'></a> Genomic Location of lncRNAs:

**Description**: The process of genomic location of lncRNAs has 3 steps. First one is to make a wide classification of lncRNAs as intergenic, genic-exonic or genic-intronic. With this classification the diagram of illustrator was generated. The second one is from the genic take all lncRNA-mRNA pairs and the third one is from genic-exonic calculate the percentage of overlapping of genic-exonic and Protein-coding genes (PCGs).

### 6.1) lncRNA classification

**Location**:
/nfs/users2/rg/ramador/D_me/RNA-seq/Genomic_Location_lncRNAs/dm6_r6.29/Results/Genome.wide.classification.name.r6.29.tsv

### 6.2) Obtain all genic-mRNA pairs

**Description**: we have two dataframes the first one which are the genic-exonic that are DGE with all lncRNA-PCG pairs because for the genic-intronic there is only one genic-intronic with more than one PCG overlapping. And a second dataframe with all genic (intronic and exonic) with all their PCG pairs.

#### 6.2.1) DGE: Obtain all genic_exonic-mRNA pairs

**Location**:/nfs/users2/rg/ramador/D_me/RNA-seq/Genomic_Location_lncRNAs/dm6_r6.29/genic-associateAllPCG/Results/DGE/genic.all.pairs.exonic.DGE.tsv

#### 6.2.2) Genome-wide: Obtain all genic-mRNA pairs

**Location**:/nfs/users2/rg/ramador/D_me/RNA-seq/Genomic_Location_lncRNAs/dm6_r6.29/genic-associateAllPCG/Results/Genome-wide/genic.all.pairs.PCG.tsv


### 6.3) Percentage of overlapping of genic-exonic and PCGs

**Location**:/nfs/users2/rg/ramador/D_me/RNA-seq/Genomic_Location_lncRNAs/dm6_r6.29/cleanSpurious_lncRNAs/Results/intersect_exon/percentage.overlapping.genic.exonic.PCG.exon.tsv

## 7) <a id='phenotype'></a> LncRNAs with phenotype:

**Description**: There are **5 lncRNAs** with **phenotype** from which there are 3 genic-exonic and 2 intergenic.

**Location**:/nfs/users2/rg/ramador/D_me/RNA-seq/lncRNA_Phenotypes/dm6_r6.29/Data/lncRNA.phenotype.complete.descriotion.v2.txt


## 8) <a id='atac'></a> ATAC-seq analysis:

### 8.1) Aggregation plots: 














