# Regeneration Project

1. [Gene analysis](#gene)
2. [Expression Matrices](#expression)
2. [Differential Gene Expression Matrix](#dge)

## 1) <a id='gene'></a> Gene analysis:

### 1.1) Gene description:

**Description**: this file contains the 16,468 genes in *D.me* using the GTF dm6.r6.29. The information is: Gene_ID, Gene_Name, Gene_Type, Length (gene length), and strand.

**Location**: /nfs/users2/rg/ramador/D_me/Data/Genes/dm6_r6.29/GeneID.Gene_Name.Gene_Type.Length.tsv

### 1.2) Transcript description:

**Description**: this file contains the 33,545 transcripts in *D.me* using the GTF dm6.r6.29. The information is: Gene_ID, Gene_Name, Transcript_ID, Transcript_Name, Gene_Type, Length (transcript length), and strand

**Location**: /nfs/users2/rg/ramador/D_me/Data/Genes/dm6_r6.29/GeneID.Gene_Name.TranscriptID.Transcript_Name.Gene_Type.Length.tsv

## 2) <a id='expression'></a> Expression Matrices:

### 2.1) Data extracted from Grape-nf pipeline:

#### 2.1.1) Matrix in TPMs:

**Description**: the rows contain the 16,455 genes and the columns the 22 different samples in regeneration.

**Location**: /nfs/no_backup_isis/rg/ramador/D_me/RNA-seq/grape-nf-dm6-r6.29/expression_matrices/regeneration.GE.TPMs.tsv

#### 2.1.2) Matrix in FPKMs:

**Location**:
/nfs/no_backup_isis/rg/ramador/D_me/RNA-seq/grape-nf-dm6-r6.29/expression_matrices/regeneration.FPKM.tsv

#### 2.1.3) Matrix in Counts:

**Location**:
/nfs/no_backup_isis/rg/ramador/D_me/RNA-seq/grape-nf-dm6-r6.29/expression_matrices/regeneration.Counts.tsv

### 2.2) Processed data:

#### 2.2.1) Collapse India replicates by mean and remove bad replicate

**Description**: this matrix contains 16,455 genes in rows and the six samples in columns: Control-0h, Regeneration-0h, Control-15h, Regeneration-15h, Control-25h, Regeneration-25h. Replicates were collapsed by mean and removing the bad replicate: *Control-0h-India-R2*

**Location**: *Table matrix* <br>
/nfs/users2/rg/ramador/D_me/RNA-seq/Metadata/dm6_r6.29/Results/India.TPMs.collapse.mean.tsv

**Location**: *R-object* <br>
/nfs/users2/rg/ramador/D_me/RNA-seq/Metadata/dm6_r6.29/Results/India.TPMs.collapse.mean.RDS

## 2) <a id='dge'></a> Differential Gene Expression Matrix:

**Description**: this matrix contains 8,455 genes which higher or equal of 1 TPM in one samples (samples are collapsed by mean from replicates). Contains: Gene_ID, Gene_Name, Gene_Type, Expression in TPMs for Control-0h, Regeneration-0h, Control-15h, Regeneration-15h, Control-25h, Regeneration-25h, Fold change group (up, down or flat; categorical variable) in the three time-points and CRG samples; and Fold Change calculation (numeric variable) only for India samples. 

**Location**:
/nfs/users2/rg/ramador/D_me/RNA-seq/DGE_reanalysis/dme_r6.29/foldchange/Results/FoldChange.calculation.india.crg.tsv
