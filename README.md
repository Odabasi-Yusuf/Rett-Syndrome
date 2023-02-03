# Rett-Syndrome
SNAKEMAKE__PRE-ANALYSIS__DEG__WGCNA__GSEA

# Snakemake
Basic quantification pipeline for bulkRNAseq data using kallisto

snakemake --use-conda -j {threads} 
You need to create a conditions.txt file inside the Rstudio working direction folder, writing each datasets condition(Healthy,Sick,etc..) //
quant file has to be in te working directory with condition.txt. //
Generating h5, TSV and JSON files.

# Pre-Analysis
After generating h5, TSV and JSON files, run the r code on Rstuido for pre-analysis//
Biomart//
tximport (to get count matrix for DEG analysis)//
sleuth

# Differential Gene Expression Analysis
Deseq2 //
Clusterprofiler //
ggplot2(volcanoplot) 

# Weighted Gene Correlation Network Analysis
WGCNA //
Human Protein Atlas //
Cytoscape 

# Gene Set Enrichment Analysis
Genesets from MSigdb (Hallmark, Biocarta, KEGG, Wikipathway, REACTOME) //
.GCT and .CLS files
