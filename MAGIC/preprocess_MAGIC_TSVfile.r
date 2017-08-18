##################################################################
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
##################################################################

# Input file path 
infp <- "M:/Bioinformatics/TranSMART/GWAS/mod_MAGIC_2hrGlucose_AdjustedForBMI.tsv"

# Output file path 
outfp <- "A:/Public Databases/MAGIC/MAGIC_2hrGlucose_AdjustedForBMI.tsv"

# Importing a .tsv file as a data frame
# Drop last empty column 
tsv_df <- read.table(file = infp
                   , sep = '\t', header = TRUE)[,1:23]

# Reordering the data set by column name 
# The order of the column names is tranSMART specified 
tsv_df <- tsv_df[c("P_VALUE", "RS_ID", "MAF", "STANDARD_ERROR", "HWE_CASES", "GENOTYPE_IMPUTED",
                   "EFFECT", "DOSE.B.0", "DOSE.B.1", "HWE_TOTAL_STUDIES", "TOTAL_NUMBER_GENOTYPED",
                   "GOOD_CLUSTERING", "GENOTYPE_COUNTS_CASES", "ODDS_RATIO", "GENOTYPE_COUNTS_CONTROLS",
                   "HETISQ", "HWE_CONTROLS", "ALLELE2", "BETA", "ALLELE1", "DIRECTION_OF_EFFECT",  
                   "RSQ", "HETPVAL")]

# Writing the modified input as .tsv file 
write.table(tsv_df, file = outfp, 
            quote=FALSE, sep='\t', na = "", row.names = FALSE)
