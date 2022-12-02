configfile:"config.yaml"
cwd = os.getcwd()
accession=config["accession"]

rule all:
    input:
      "sleuth_object.so",
      "gene_table_results.txt"

rule downloadKallistoIndex:
    output:
      "homo_sapiens/Homo_sapiens.GRCh38.96.gtf",
      "homo_sapiens/Homo_sapiens.GRCh38.cdna.all.fa",
      "homo_sapiens/transcriptome.idx",
      "homo_sapiens/transcripts_to_genes.txt"
    conda:
      "env.yml"
    shell:
      'wget https://github.com/pachterlab/kallisto-transcriptome-indices/releases/download/ensembl-96/homo_sapiens.tar.gz && \
      tar xvzf homo_sapiens.tar.gz'

if config["read_type"]== "SE":
    rule fetch_FASTQ_from_SRA_SE:
        output:
            temp("reads/{accession}/{accession}.fastq")
        params:
            args = "--progress --details",
            accession = "{accession}"
        conda:
            "env.yml"
        message:
            "Downloading single-end reads for SRA"
        shell:
            'mkdir -p reads/{params.accession} && \
            fasterq-dump {params.args} {params.accession} -O reads/{params.accession}'

if config["read_type"]== "PE":
    rule fetch_FASTQ_from_SRA_PE:
        output:
            temp("reads/{accession}/{accession}_1.fastq"),
            temp("reads/{accession}/{accession}_2.fastq")
        params:
            args = "--split-files --progress --details",
            accession = "{accession}"
        conda:
            "env.yml"
        message:
            "Downloading paired-end reads for SRA"
        shell:
            'mkdir -p reads/{params.accession} && \
            fasterq-dump {params.args} {params.accession} -O reads/{params.accession}'

if config["read_type"]== "SE":
    rule kallistoQuant_SE:
        input:
            "homo_sapiens/Homo_sapiens.GRCh38.96.gtf",
            "homo_sapiens/Homo_sapiens.GRCh38.cdna.all.fa",
            "homo_sapiens/transcripts_to_genes.txt",
            index="homo_sapiens/transcriptome.idx",
            read="reads/{accession}/{accession}.fastq"
        output:
            "quant/{accession}/abundance.h5",
            "quant/{accession}/abundance.tsv",
            "quant/{accession}/run_info.json"
        params:
            bootstrap="5",
            accession = "{accession}",
            len = "200",
            sd = "20"
        conda:
            "env.yml"
        shell:
            "mkdir -p quant/{params.accession} && \
            kallisto quant -b {params.bootstrap} -i {input.index} -o quant/{params.accession} --single {input.read} -l {params.len} -s {params.sd}"

if config["read_type"]== "PE":
    rule kallistoQuant_PE:
        input:
            "homo_sapiens/Homo_sapiens.GRCh38.96.gtf",
            "homo_sapiens/Homo_sapiens.GRCh38.cdna.all.fa",
            "homo_sapiens/transcripts_to_genes.txt",
            index="homo_sapiens/transcriptome.idx",
            r1="reads/{accession}/{accession}_1.fastq",
            r2="reads/{accession}/{accession}_2.fastq",
        output:
            "quant/{accession}/abundance.h5",
            "quant/{accession}/abundance.tsv",
            "quant/{accession}/run_info.json"
        params:
            bootstrap="5",
            accession = "{accession}"
        conda:
            "env.yml"
        shell:
            "mkdir -p quant/{params.accession} && \
            kallisto quant -b {params.bootstrap} -i {input.index} -o quant/{params.accession} {input.r1} {input.r2}"

rule mergeQuant:
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
