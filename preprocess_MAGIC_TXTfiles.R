###############################################################
# 
# FILE          : preprocess_MAGIC_TXTfiles.r
#
# PROJECT       : tranSMART-project (GitHub repo) 
#
# SUB-PRJT      : Load GWAS data (repo issue)
#
# DESCRIPTION   : Loads a MAGIC .txt file and rearranges the 
#                 column order, and writes the resulting
#                 table as a .tsv file 
###############################################################

# Input file 
infile <- "MAGIC_ln_HOMA-IR"

# Input file path 
infp <- paste("A:/Public Databases/MAGIC/Original txt files/", infile, ".txt", sep='')

# Output file path 
outfp <- paste("A:/Public Databases/MAGIC/Data for loading/", infile, ".tsv", sep='')

# Importing a .txt file as a data frame
txt_df <- read.table(file = infp, sep = '\t', header = TRUE)
colnames(txt_df) <- c("RS_ID", "ALLELE1", "ALLELE2", "MAF", "EFFECT", "STANDARD_ERROR" ,"P_VALUE")

# Reordering the data set by column name and apply dummy padding  
txt_df <- cbind(txt_df[c("P_VALUE", "RS_ID", "MAF", "STANDARD_ERROR")],
                setNames(replicate(2,numeric(nrow(txt_df)),simplify = F),replicate(2,"NA")),
                txt_df["EFFECT"],
                setNames(replicate(10,numeric(nrow(txt_df)),simplify = F),replicate(10,"NA")),
                txt_df["ALLELE2"],
                setNames(replicate(1,numeric(nrow(txt_df)),simplify=F),"NA"),
                txt_df["ALLELE1"],
                setNames(replicate(3,numeric(nrow(txt_df)),simplify = F),replicate(3,"NA")))

# Writing the modified input as .tsv file 
write.table(txt_df, file = outfp, 
            quote=FALSE, sep='\t', na = "", row.names = FALSE)