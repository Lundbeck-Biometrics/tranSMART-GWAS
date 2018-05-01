#####################################################################
# 
# FILE          : Create_GWAS_Metadata.r
#
# DESCRIPTION   : Loads the .xlsx template GWAS metadata file, 
#                 transposes its contents, and writes the table as 
#                 a .txt file 
#####################################################################

# One of many packages that can import EXCEL
library(xlsx)

# Input source file path 
infp <- "B:/Programs/External Studies/PGC/CONVERGE_MDD_2015/tranSMART GWAS metadata template.xlsx"

# Output file path
outfp <- "A:/External_Studies/PGC/CONVERGE_MDD/converge.MDD.summary_stats.2Sep2015.tbl/Ready_to_Load/gwas/CONVERGE_2015_metadata.tsv"

# Import XLSX file 
gwas_metadata <- read.xlsx(file=infp,sheetName = "Metadata", colIndex = c(4,8))

# Transposing the meta data set
gwas_metadata_trp <- t(gwas_metadata)

# Generating the contents for the "study" variable 
tmp_study <- paste0(gwas_metadata_trp[2,gwas_metadata_trp[1,] %in% "study"],":",gwas_metadata_trp[2,gwas_metadata_trp[1,] %in% "studyTitle"])

# Assigning the study name to studyId variable 
gwas_metadata_trp[2,gwas_metadata_trp[1,] %in% "studyId"] <- gwas_metadata_trp[2,gwas_metadata_trp[1,] %in% "study"]

# Inserting the desired contents for the "study" variable
gwas_metadata_trp[2,gwas_metadata_trp[1,] %in% "study"] <- tmp_study

# Dropping variables not going to the GWAS metadata
gwas_metadata_trp <- gwas_metadata_trp[,!gwas_metadata_trp[1,] %in% c("studyTitle","accessRestrict","dataCount")]

# Writing the output to a .tsv file
write.table(gwas_metadata_trp, file = outfp, 
            quote=FALSE, sep='\t', na = "", row.names = FALSE, col.names = FALSE, eol="\r")