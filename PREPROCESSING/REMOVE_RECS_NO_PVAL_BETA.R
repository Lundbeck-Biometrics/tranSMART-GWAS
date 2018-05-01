# A function that removes records/observations from GWAS data
# that are not associated with a p- AND beta-value (effect size)

REMOVE_RECS_NO_PVAL_BETA <- function(ds) {
  
  # Getting the indices of records with no P- AND beta-value
  idx_no_val <- as.numeric(rownames(ds[is.na(ds$BETA) & is.na(ds$P_VALUE),]))
  
  # No cases return input data set
  if (is.null(dim(idx_no_val))){
    return(ds)
  } 
  # Remove records fulfilling the criteria for P-value and BETA
  else {
    ds_out <- ds[-idx_no_val,] 
    return(ds_out)
  }
}