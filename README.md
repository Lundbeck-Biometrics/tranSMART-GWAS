# Getting GWAS Data Ready for tranSMART
This paragraph describes the steps needed to prepare GWAS data for loading into tranSMART. All scripts and templates available in this repository assume the use of tranSMART-batch as the loading tool.

An overview of the GWAS preprocessing process is shown below:

![alt text](https://github.com/Lundbeck-Biometrics/tranSMART-GWAS/blob/master/GWAS_preprocessing_overview.jpg)

Details on individual parts of the process is found in the following paragraphs.

## Lifting GWAS data to target dbSNP version

## Preprocessing lifted GWAS data

## Extract metadata on GWAS data
This step is usually the most laborous of the entire process of loading GWAS data into tranSMART as it requires reading and extracting essential information on how the GWAS data was generated. The primary source of information is most likely the peer-reviewed journal papers accompanying the GWAS data.

## Generate GWAS metadata
Before loading GWAS data, it is necessary to generate some meaningful metadata to support the GWAS data. This metadata will be visible in the tranSMART interface alongside with the data. In order to ease the process of providing meaningful metadata, a GWAS metadata template has been created (can be found here: https://github.com/Lundbeck-Biometrics/tranSMART-GWAS/tree/master/GWAS_METADATA_TEMPLATE). The column "Field Value" is the only column that needs to be updated with data on the study. 






# Loading GWAS Data into tranSMART

## tranSMART Batch Commands
