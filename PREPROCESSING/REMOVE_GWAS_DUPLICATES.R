# A function that identifies duplicates on RS_ID in GWAS data,
# and resolves duplicates 

REMOVE_GWAS_DUPLICATES <- function(ds) {
  
  # A logical vector representing the indices in input data set
  ds_lg <- !logical(nrow(ds))
  
  # Names of RS_IDs that are true duplicates
  dup_rsids <- as.vector(ds[duplicated(ds$RS_ID), 1])
  
  # Indices for the duplicates in dup_rsids
  idx_dups = as.numeric(rownames(ds[ds$RS_ID %in% dup_rsids, ]))
  
  # All indices related to duplicates are set to FALSE
  ds_lg[idx_dups] = FALSE
  
  # A temporary numeric vector to contain the duplicates records to keep
  dix_keep <- numeric(length = length(dup_rsids))
  
  # Looping through the duplicate RS_IDs
  for (i in 1:length(dup_rsids)) {
    
    # Indices in input data set that are duplicates
    dix = as.numeric(rownames(ds[ds$RS_ID == dup_rsids[i], ]))
    
    # Subselection set based on dix
    dix_set <- ds[dix, ]
    
    # Finding the minimum value of P_VALUE and maximum value BETA for the duplicates
    ans_pval <- min(dix_set$P_VALUE)
    ans_beta <- max(dix_set$BETA)
    
    # None of the P-values are missing
    if (!is.na(ans_pval)) {
     
      # Determining which of the duplicates has the smallest p-value
      ans_min_pvalue <- dix_set$P_VALUE == ans_pval
      
      # Determining which of the duplicates has the largest BETA
      ans_max_beta <- dix_set$BETA == ans_beta
      
      # Tie in P-value
      if (ans_min_pvalue[1] == TRUE & ans_min_pvalue[2] == TRUE) {
       
        # Use BETA to determine which duplicate to keep
        if (!is.na(ans_beta)) {
          if (ans_max_beta[1] == TRUE & ans_max_beta[2] == TRUE) {
            dix_keep[i] <- dix[1]
            
          } else if (ans_max_beta[1] == TRUE &
                     ans_max_beta[2] == FALSE) {
            dix_keep[i] <- dix[1]
            
          } else if (ans_max_beta[1] == FALSE &
                     ans_max_beta[2] == TRUE) {
            dix_keep[i] <- dix[2]
          }
        }
        # Use first duplicate if BETAs are NA
        else {
          dix_keep[i] <- dix[1]
        }
        
      # No tie in P-value
      } else if (ans_min_pvalue[1] == TRUE &
                 ans_min_pvalue[2] == FALSE) {
        dix_keep[i] <- dix[1]
        
      } else if (ans_min_pvalue[1] == FALSE &
                 ans_min_pvalue[2] == TRUE) {
        dix_keep[i] <- dix[2]
      }
    }
    # Both P-values are missing
    else {
      
      # Using maximum BETA as selection criteria
      ans_max_beta <- dix_set$BETA == ans_beta
      
      # BETAs are equal, keep only first of duplicates 
      if (ans_max_beta[1] == TRUE & ans_max_beta[2] == TRUE) {
        dix_keep[i] <- dix[1]
        
      } else if (ans_max_beta[1] == TRUE &
                 ans_max_beta[2] == FALSE) {
        dix_keep[i] <- dix[1]
        
      } else if (ans_max_beta[1] == FALSE & ans_max_beta[2] == TRUE) {
        dix_keep[i] <- dix[2]
      }
    }
  }
  
  # Correct the logical vector for the indices in input data set
  ds_lg[dix_keep] = TRUE
  
  # Applying the locigal index vector upon the input data set
  ds_post <- ds[ds_lg, ]
  
  # Returning the input data set without duplicates
  return(ds_post)
}