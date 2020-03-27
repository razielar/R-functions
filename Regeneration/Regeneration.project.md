# Regeneration Project

1. [Gene analysis](#gene)
2. [Metadata](#meta)
3. [Expression Matrices](#expression)
4. [Analysis of replicates: RNA-seq](#replicates)
5. [Covariable analysis: India and CRG samples](#covariable)
6. [Differential Gene Expression Matrix](#dge)
7. [Genome-wide Classification of lncRNAs](#location)
8. [Description of neighbor PCGs](#pcgs)
9. [LncRNAs with phenotype](#phenotype)
10. [ATAC-seq analysis](#atac)

## Latest df:

**Description**: use the cutoff of 20% of overlapping between genic-exonic and PCGs with mRNA_ID, TPM expression and fold change group (categorical variable). Obtaining a total of **182 DGE lncRNAs**: *109 intergenic*, *36 genic-intronic* and *37 genic_exonic*. Add NA in FoldChange_group (categorical),  and add *0* for FoldChange (numerical) for lncRNAs and mRNAs if they expression is below of 1 TPM in one sample in each time-point. Add GC% of the gene and description (lncRNAs and neighbor mRNAs). Add L3 information. Add category of lincRNAs depending of thier distance; proximal <= 500 bp or distant > 500 bp from their PCG. <br>
Need to add orthologs analysis of neighbor mRNAs.

**Location**: /nfs/users2/rg/ramador/D_me/RNA-seq/mRNA_lncRNA_patternanalysis/Results/DGE.lncRNA.india.crg.genomiclocation.all.PCG.pairs.exonic.cutoff.mRNAs.expression.NA.0.GC.Descr.L3.cat.lincRNA.tsv


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

### 1.3) LncRNA Feature analysis:

**Description**: using the GTF dm6.r6.29, there are **2,511** lncRNA genes, **2,956** lncRNA transcripts, and **4,776** exons, we described for lncRNAs the number of transcripts per gene and the number of genes and transcript monoexonic, diexonic, etc. For exon, transcript and gene length the plot was cutted to skip outliers and see the more represented values values. For gene and trasncripts cutted from 250 kb to 8kb, for exons from 20 kb to 8kb. For transcripts per gene:

| Number of genes   |     With *N* number of transcripts     |
|----------|:-------------:|
| 2186 | 1 |
| 255 | 2 |
| 53 | 3 |
| 5 | 4 |
| 4 | 5 |
| 4 | 6 |
| 1 | 7 |
| 1 | 8 |
| 1 | 10 |
| 1 | 12 |  

Number of exons per gene was cut from 10 to 80.

**Location**:
*Table matrix:*  <br>
/nfs/users2/rg/ramador/D_me/denovo_lncRNAs/description.annotated.lncRNAs/dm6.r6.29/Results/feature.description.lncRNAs.tsv  <br>
*Plot:*  <br>
/nfs/users2/rg/ramador/D_me/denovo_lncRNAs/description.annotated.lncRNAs/dm6.r6.29/Plots/annotated.lncRNAs.and.DGE.lncRNAs.features.pdf

## 2) <a id='meta'></a> Metadata:

### 2.1) Metadata India:

#### 2.1.1) Sequencing report India

**Description**: RNA-seq pair-end, non-stranded, 76 bp length.

**Location**: /nfs/users2/rg/ramador/D_me/RNA-seq/Covariable_analysis/Sequencing.report.India.pdf

#### 2.1.2) Complete Metada India

**Description**: complete metadata of all available RNA-seq from India. Contains: experiment_ID (link ID from grape-nf to tailor variable name), replicate_id, sample_type (L3, control or regeneration), time-point, tailor_variable_name.

**Location**: <br>
*Table matrix:*  <br>
/nfs/users2/rg/ramador/D_me/RNA-seq/Metadata/dm6_r6.29/Results/Metadata.India.complete.tsv <br>
*R-object:*  <br>
/nfs/users2/rg/ramador/D_me/RNA-seq/Metadata/dm6_r6.29/Results/Metadata.India.complete.RDS <br>

#### 2.1.3) Used time-points Metadata India

**Description**: this is only for India samples and for the 3 time-points. Contains: experiment_ID (link ID from grape-nf to tailor variable name), replicate_id, sample_type (either control or regeneration), time-point, tailor_variable_name.

**Location**:/nfs/users2/rg/ramador/D_me/RNA-seq/Metadata/dm6_r6.29/Data/Metadata.India.0h.15h.25h.rda

### 2.2) Metadata CRG:

#### 2.2.1) Metadata CRG complete

**Description**: CRG samples: labExpId, sampleId, sampleType, time and Metadata.

**Location**:

*Table matrix:*  <br>
/nfs/users2/rg/ramador/D_me/RNA-seq/Metadata/dm6_r6.29/Results/Metadata.CRG.complete.tsv <br>


#### 2.2.2) Metadata CRG compact

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


#### 3.2.3) India samples: Collapse India and L3 replicates by mean and remove bad replicate

**Description**: this matrix contains 8,458 genes in rows and 7 samples in columns: L3, Control-0h, Regeneration-0h, Control-15h, Regeneration-15h, Control-25h, Regeneration-25h. The expression cutoff: keep genes that are higher or equal of 1 TPM in at least one time-point; a.k.a: 2 replicates only taking into account the samples described before. Replicates were collapsed by mean and removing the bad replicate: *Control-0h-India-R2*

**Location**: <br>
*Table matrix* <br>
/nfs/users2/rg/ramador/D_me/RNA-seq/mRNA_lncRNA_patternanalysis/Results/India.L3.TPMs.collapse.mean.tsv <br>
*R-object* <br>
/nfs/users2/rg/ramador/D_me/RNA-seq/mRNA_lncRNA_patternanalysis/Results/India.L3.TPMs.collapse.mean.RDS


#### 3.2.4) CRG samples: with tailor variable name

**Description**: this matrix contains 16,455 genes in rows and four samples in columns: Control-0h-CRG, Regeneration-0h-CRG, Control-25h-CRG, Regeneration-25h-CRG.

**Location**: <br>
*Table matrix* <br>
/nfs/users2/rg/ramador/D_me/RNA-seq/Expression-Matrices/dm6_r6.29/CRG.TPMs.tsv <br>
*R-object* <br>
/nfs/users2/rg/ramador/D_me/RNA-seq/Expression-Matrices/dm6_r6.29/CRG.TPMs.RDS

#### 3.2.5) CRG samples: with tailor variable name and expression cutoff

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

**Description**: PCA of replicates, correlation plots replicates, Z-score analysis, boxplot replicates, heatmap of pearson correlation. Remove the bad replicate.

**Location**:/nfs/users2/rg/ramador/D_me/RNA-seq/Covariable_analysis/dm6_r6.29/Plots/QC_plots/Number.reads.pdf

## 5) <a id='covariable'></a> Covariable analysis: India and CRG samples:

**Description**: Analysis of covariable for India and CRG samples, using QC data from the bam files: The first sheet describes the number of reads, number of mapped reads and GC percentage (lowe the better easier to sequence). <br>
Second sheet, we used: numberofreads, numberofmappedreads, numberofmappedbases, numberofsequencedbases, duplicationrate, GCpercentage, ALIGNED_READS, AT_DROPOUT, GC_DROPOUT, PF_READS, PF_READS_ALIGNED, PCT_PF_READS_ALIGNED, PF_ALIGNED_BASES, PCT_CHIMERAS and do a dimensionality reduction by PCA. First and second component explain 0.972 and 0.025 percentage of variability, respectively.

**Location**:/nfs/users2/rg/ramador/D_me/RNA-seq/Covariable_analysis/dm6_r6.29/Plots/All.india.crg.number.reads.QC.PCA.pdf

## 6) <a id='dge'></a> Differential Gene Expression Matrix:

**Description**: this matrix contains **8,455 genes** which **higher or equal of 1 TPM** in one samples (samples are collapsed by mean from replicates). Contains:

* *Gene_ID*: FBgn0000003, FBgn0000052, etc.
* Gene_Name: 7SLRNA:CR32864, Pfas, etc.
* Gene_Type: mRNA or nRNA.
* Expression in TPMs for: Control & Regeneration in the three time-points (only for India samples).
* Fold change group: up, down or flat (categorical variable) in the three time-points and CRG samples.
* Fold Change calculation: (numeric variable) only for India samples.

Fold change was calculated if there is one gene which is not expressed (or lower than the cutoff) a pseudo-count was used to retain cases in which a lncRNA in one case is expressed more than 1 TPM and in another case not expressed.

**Location**:
/nfs/users2/rg/ramador/D_me/RNA-seq/DGE_reanalysis/dme_r6.29/foldchange/Results/FoldChange.calculation.india.crg.tsv


## 7) <a id='location'></a> Genome-wide Classification of lncRNAs:

**Description**: The process of genomic location of lncRNAs has 3 steps. First one is to make a wide classification of lncRNAs as intergenic, genic-exonic or genic-intronic. With this classification the diagram of illustrator was generated. The second one is from the genic take all lncRNA-mRNA pairs and the third one is from genic-exonic calculate the percentage of overlapping of genic-exonic and Protein-coding genes (PCGs).

### 7.1) Genome-wide Classification of lncRNAs:

**Description**: In this file we have a total of 2,514 lncRNAs divided as type: *genic*: 1,115 and *intergenic*: 1399; and divided by subtype: *intergenic*: same_strand: 690, divergent: 389 and convergent: 620 and *genic*: intronic: 431 and exonic: 684. The distance between lincRNAs and neighbor PCG is from end to start of genes, regardless which is firt and last.

**Location**: /nfs/users2/rg/ramador/D_me/RNA-seq/Genomic_Location_lncRNAs/dm6_r6.29/Results/Genome.wide.classification.name.r6.29.PCG_ID.tsv

### 7.2) Genome-wide analysis of distance between lincRNAs and their neighbor PCGs:

#### 7.2.1) Genome-wide analysis of distance: (end to start) between lincRNAs and their neighbor PCGs:

**Description**: The distance between lincRNAs and their neighbor PCGs is from end to start of genes. Higher distance between lincRNA and their PCGs is: Same_strand > convergent > divergent meaning that same_strand has the largest distance between their PCGs. Using *Kruskal-Wallis test* there is only significant difference between same_strand and divergent with an adjust p-value (fdr) of 2.2e-5.

**Plot**: /nfs/users2/rg/ramador/D_me/RNA-seq/Genomic_Location_lncRNAs/dm6_r6.29/analysis_lincRNA_distance/Plots/distance.genome.wide.lincRNAs.not.ouliers.pdf

#### 7.2.2) Genome-wide analysis of distance: (TSS to TSS) between lincRNAs and their neighbor PCGs:

**Description**: This file has the exact same structure as: *Genome.wide.classification.name.r6.29.PCG_ID.tsv* the only difference is having: *distance_tss* instead of *distance*.

**Location**: /nfs/users2/rg/ramador/D_me/RNA-seq/Genomic_Location_lncRNAs/dm6_r6.29/analysis_lincRNA_distance/Results/Genome.wide.classification.name.TSS.r6.29.PCG_ID.tsv


### 7.3) Obtain all genic-mRNA pairs

**Description**: we have two dataframes the first one which are the genic-exonic that are DGE with all lncRNA-PCG pairs because for the genic-intronic there is only one genic-intronic with more than one PCG overlapping. And a second dataframe with all genic (intronic and exonic) with all their PCG pairs.

#### 7.3.1) DGE: Obtain all genic_exonic-mRNA pairs

**Location**:/nfs/users2/rg/ramador/D_me/RNA-seq/Genomic_Location_lncRNAs/dm6_r6.29/genic-associateAllPCG/Results/DGE/genic.all.pairs.exonic.DGE.tsv

#### 7.3.2) Genome-wide: Obtain all genic-mRNA pairs

**Location**:/nfs/users2/rg/ramador/D_me/RNA-seq/Genomic_Location_lncRNAs/dm6_r6.29/genic-associateAllPCG/Results/Genome-wide/genic.all.pairs.PCG.tsv


### 7.4) Percentage of overlapping of genic-exonic and PCGs

**Location**:/nfs/users2/rg/ramador/D_me/RNA-seq/Genomic_Location_lncRNAs/dm6_r6.29/cleanSpurious_lncRNAs/Results/intersect_exon/percentage.overlapping.genic.exonic.PCG.exon.tsv

## 8) <a id='pcgs'></a> Description of neighbor PCGs:

### 8.1) Observe distance between DGE lincRNA and their PCG

**Description**: We observe the distance between the DGE lincRNAs and their corresponding PCGs, setting up a cutoff of 500 bp distance; proximal <= 500 bp and distant > 500 bp.

**Location**: /nfs/users2/rg/ramador/D_me/RNA-seq/mRNA_lncRNA_patternanalysis/Results/DGE.lncRNA.india.crg.genomiclocation.all.PCG.pairs.exonic.cutoff.mRNAs.expression.NA.0.GC.Descr.L3.cat.lincRNA.tsv

**Plot**: /nfs/users2/rg/ramador/D_me/RNA-seq/mRNA_lncRNA_patternanalysis/Plots/distance.distribution.lincRNAs.pdf

### 8.2) Categorical description of DGE lncRNA and their PCGs

**Description**: Concordant: lncRNA-up == mRNA-up or lncRNA-down == mRNA-down. Discordant: lncRNA-up == mRNA-down or lncRNA-down == mRNA-up. lncRNA-DGE-mRNA-flat (or not expressed). This analysis was made only for the DGE. In this analysis we are using genic-exonic, genic-intronic and proximal-lincRNAs (distance <= 500 bp from PCG). Obtaining 122 pairs but we removed 11 pairs in which the PCGs were not expressed in any time-point and in any sample-type (control or regeneration). Having a total of **111 pairs**: 72 genic-PCG (exonic: 39 and intronic: 33) and 39 proximal_lincRNA-PCG (convergent: 13, divergent: 15 and same-strand: 11).

**111 pairs location:** /nfs/users2/rg/ramador/D_me/RNA-seq/mRNA_lncRNA_patternanalysis/Results/association.mRNA.lncRNA.input.RDS  <br>


**Location**: /nfs/users2/rg/ramador/D_me/RNA-seq/mRNA_lncRNA_patternanalysis/Results/categorical.analysis..PCG.neighbors.genic.proximal.lincRNA.tsv <br>
**Plot**: /nfs/users2/rg/ramador/D_me/RNA-seq/mRNA_lncRNA_patternanalysis/Plots/categorcial.association.genic.lincRNA.proximal.pdf

### 8.3) Numerical analysis of DGE lncRNA and their PCGs

#### 8.3.1) K-means clustering

**Plot**: /nfs/users2/rg/ramador/D_me/RNA-seq/mRNA_lncRNA_patternanalysis/Plots/association.cluster.analysis.grid.pdf <br>

#### 8.3.2) Slope analysis

**Plot**: /nfs/users2/rg/ramador/D_me/RNA-seq/mRNA_lncRNA_patternanalysis/Plots/association.lncRNA.mRNA.pdf


## 9) <a id='phenotype'></a> LncRNAs with phenotype:

**Description**: There are **5 lncRNAs** with **phenotype** from which there are 3 genic-exonic and 2 intergenic.

**Location**:/nfs/users2/rg/ramador/D_me/RNA-seq/lncRNA_Phenotypes/dm6_r6.29/Data/lncRNA.phenotype.complete.descriotion.v3.txt

## 10) <a id='atac'></a> ATAC-seq analysis:

### 10.1) Aggregation plots:
