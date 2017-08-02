##########################################################
# 
# FILE          : preprocess_MAGIC_TSVfile.r
#
# PROJECT       : tranSMART-project (GitHub repo) 
#
# SUB-PRJT      : Load GWAS data (repo issue)
#
# DESCRIPTION   : Loads the MAGIC .tsv file and rearranges the 
#                 column order, and writes the resulting
#                 table as a .tsv file 
#########################################################

# Input file path 
infp <- "M:/Bioinformatics/TranSMART/GWAS/mod_MAGIC_2hrGlucose_AdjustedForBMI.tsv"

# Output file path 
outfp <- "M:/Bioinformatics/TranSMART/GWAS/MAGIC_mod/mod_MAGIC_2hrGlucose_AdjustedForBMI.tsv"

# Importing a .tsv file as a data frame
# Drop last empty column 
tsv_df <- read.table(file = infp
                   , sep = '\t', header = TRUE)[,1:23]

# Reordering the data set by column name 
# The order of the column names is tranSMART specified 
tsv_df <- tsv_df[c("P_VALUE", "RS_ID", "ODDS_RATIO", "BETA", "DIRECTION_OF_EFFECT", "HWE_CONTROLS", "HWE_CASES",
                   "HWE_TOTAL_STUDIES", "MAF", "GENOTYPE_COUNTS_CASES", "GENOTYPE_COUNTS_CONTROLS", 
                   "TOTAL_NUMBER_GENOTYPED", "ALLELE1", "ALLELE2", "GOOD_CLUSTERING", "EFFECT", 
                   "STANDARD_ERROR", "HETISQ", "HETPVAL", "GENOTYPE_IMPUTED", "RSQ", "DOSE.B.0", "DOSE.B.1")]

# Writing the modified input as .tsv file 
write.table(tsv_df, file = outfp, 
            quote=FALSE, sep='\t', na = "", row.names = FALSE)
