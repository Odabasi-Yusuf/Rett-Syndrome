library(devtools)
library(rhdf5)
library(biomaRt)
library(tximport)

                                        #-----------------Generate Count Matrix--------------------
#base_dir <- "./SRRs-all"
#sample_id <- dir(file.path(base_dir))
#kal_dirs <- sapply(sample_id, function(id) file.path(base_dir, id, "abundance.h5"))
#condition_all <- read.delim("SraRunTable-all-yeni.txt", sep = ",")
#mart <- biomaRt::useMart(biomart = "ENSEMBL_MART_ENSEMBL",dataset = "hsapiens_gene_ensembl",host = 'ensembl.org')
#t2g1 <- getBM(attributes = c("ensembl_transcript_id","external_gene_name","transcript_biotype"), mart = mart)
#t2g1 = t2g1[which(t2g1$transcript_biotype=="protein_coding"),]
#load("tximport.Rdata")
#txi <- tximport(kal_dirs, type = "kallisto", tx2gene = as_tibble(t2g1), ignoreTxVersion = TRUE)
#count<- as.data.frame(txi$counts)
#count<- count[-1,]
#count<- round(count,0)
#saveRDS(count,file = "alldata_count.rds")