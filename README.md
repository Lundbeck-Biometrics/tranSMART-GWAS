# Getting GWAS Data Ready for tranSMART
This paragraph describes the steps needed to prepare GWAS data for loading into tranSMART. All scripts and templates available in this repository assume the use of tranSMART-batch as the loading tool.

An overview of the GWAS preprocessing process is shown below:

![alt text](https://github.com/Lundbeck-Biometrics/tranSMART-GWAS/blob/master/GWAS_preprocessing_overview.jpg)

Details on individual parts of the process are found in the following paragraphs.

## Lifting GWAS data to target dbSNP version

## Preprocessing lifted GWAS data
Once the GWAS data has been lifted to a target dbSNP version (defined by the tranSMART adminstrators), the next step is to map and curate the data. The figure below illustrates the process: 

![alt text](https://github.com/Lundbeck-Biometrics/tranSMART-GWAS/blob/master/GWAS_preprocessing_data.jpg)

The R script responsible for the preprocessing and mapping of the lifted GWAS data is called ''PREPROCESS_GWAS.R''. This script requires a text file (like shown in the figure below) with information on how the GWAS data should be mapped to the tranSMART data model for GWAS data, and 

## Extract Metadata on GWAS Data
This step is usually the most laborous of the entire process of loading GWAS data into tranSMART as it requires reading and extracting essential information on how the GWAS data was generated. The primary source of information is most likely the peer-reviewed journal papers accompanying the GWAS data.

## Generate GWAS Metadata
Before loading GWAS data, it is necessary to generate some meaningful metadata to support the GWAS data. This metadata will be visible in the tranSMART interface alongside with the data. In order to ease the process of providing meaningful metadata, a GWAS metadata template has been created (can be found here: https://github.com/Lundbeck-Biometrics/tranSMART-GWAS/tree/master/GWAS_METADATA_TEMPLATE). The column "Field Value" is the only column that needs to be updated with data on the study. 

![alt text](https://github.com/Lundbeck-Biometrics/tranSMART-GWAS/blob/master/GWAS_metadata_generation.jpg)




# Loading GWAS Data into tranSMART

## Making a gwas.params file

## tranSMART Batch Commands
