##################################################################
# 
# FILE          : preprocess_GWAS.r
#
# DESCRIPTION   : Loads a GWAS .txt file and rearranges
#                 the column order, and writes the resulting
#                 table as a .tsv file 
##################################################################

# Input source file path 
infp <- "A:/External_Studies/PGC/CONVERGE_MDD/converge.MDD.summary_stats.2Sep2015.tbl/liftover/converge.MDD.summary_stats.2Sep2015.txt.lifted.txt"

# Input mapping file path
mpfp <- "A:/External_Studies/PGC/CONVERGE_MDD/converge.MDD.summary_stats.2Sep2015.tbl/CONVERGE_MAPPING.txt"

# Output file path 
outfp <- "A:/External_Studies/PGC/CONVERGE_MDD/converge.MDD.summary_stats.2Sep2015.tbl/Ready_to_Load/gwas/converge_MDD.tsv"

# Importing .txt files as data frames
ds_df <- read.table(file = infp, header = TRUE)
no_rows <- nrow(ds_df)

# Importing mapping file 
map_df <- data.frame(read.table(file = mpfp, header = FALSE, sep = '&'))

# Making a keep variable list of variables mapped to GWAS model 
keep_vars <- as.character(map_df[map_df$V2 != "N",2])

# Only data from mapped columns in data set are kept 
ds_mapped <- ds_df[c(names(ds_df) %in% keep_vars)]

# Number of data set columns mapped to GWAS model
num_mapped <- length(ds_mapped)

# Transposing column 2 (carrying the source variable names) of the mapping 
map_dft <- t(map_df)

# This is the expected order of the GWAS variables
ds_order <- map_dft[2,]

# Padding the slim converge_mapped data set to expected GWAS meta data 
num_pads <- nrow(map_df) - num_mapped 
ds_ext <- cbind(ds_mapped,replicate(num_pads,replicate(no_rows,NA)))

# Creating dummy variable names for re-assignment
dummy_vars <- as.character(c(1:num_pads))
names(ds_ext)[names(ds_ext) %in% dummy_vars] = "N" 

# Forcing the expected order of variables based on GWAS meta data
ds_final <- ds_ext[ds_order]

# Forcing the expected naming of variables based on GWAS meta data
colnames(ds_final) <- map_dft[1,]

# Removing records with no P- and BETA-value
source('REMOVE_RECS_NO_PVAL_BETA.R')
ds_final <- REMOVE_RECS_NO_PVAL_BETA(ds_final)

# Enabling the calling of REMOVE_GWAS_DUPLICATES function
source('REMOVE_GWAS_DUPLICATES.R')
ds_post <- REMOVE_GWAS_DUPLICATES(ds_final)

# Writing the output to a ready-to-load .tsv file
write.table(ds_post, file = outfp, 
            quote=FALSE, sep='\t', na = "", row.names = FALSE)