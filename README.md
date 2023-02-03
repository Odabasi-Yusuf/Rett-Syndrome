snakemake
# basic quantification pipeline for bulkRNAseq data using kallisto

### snakemake --use-conda -j {threads} 
### You need to create a conditions.txt file inside the Rstudio working direction folder, writing each datasets condition(Healthy,Sick,etc..)
### quant file has to be in te working directory with condition.txt.
### after generating h5, TSV and JSON files, run the r code on Rstuido.

# Rett-Syndrome
SNAKEMAKE__PRE-ANALYSIS__DEG__WGCNA__GSEA


YOU CAN FIND ALL STEPS İN 5 DIFFERENT BRANCHES
main
