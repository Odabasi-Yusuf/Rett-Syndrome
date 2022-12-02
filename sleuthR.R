library(devtools)
library(rhdf5)
library(sleuth)
library(biomaRt)

#------------------------------------------------------ALL_DATASET----------------------------------------------------------------

#base_dir <- "./SRRs-all"
#sample_id <- dir(file.path(base_dir))
#kal_dirs <- sapply(sample_id, function(id) file.path(base_dir, id))
condition_all <- read.delim("SraRunTable-all-yeni.txt", sep = ",")
#s2c <- data.frame(path=kal_dirs,sample=sample_id,condition=condition_df,row.names = NULL,stringsAsFactors = FALSE)
#load("t2g.Rdata")
#so_all <- sleuth_prep(s2c, target_mapping = t2g, aggregation_column = 'ext_gene', gene_mode = TRUE, extra_bootstrap_summary = TRUE)
#save(so_all, file = "so_all.Rdata")
#load("so_all.Rdata")
#GL_matrix_all <- sleuth_to_matrix(so_all, "obs_norm", "tpm")
#GL_df_all <- as.data.frame(GL_matrix_all)
#saveRDS(GL_df_all, file = "82data_TPM.rds")
#rm(s2c,t2g, GL_matrix_all)
#gc()