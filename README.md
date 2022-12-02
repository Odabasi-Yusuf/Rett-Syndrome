# basic quantification pipeline for bulkRNAseq data using kallisto

snakemake --use-conda -j {threads} 

#rule mergeQuant:
    input:
        expand("quant/{accession}/abundance.h5",accession=config["accession"])
    output:
       out1="sleuth_object.so",
     out2="gene_table_results.txt"
    params:
      wd=cwd
    conda:
      "r.yml"
    shell:
      "Rscript scripts/sleuthR.R {params.wd}"
