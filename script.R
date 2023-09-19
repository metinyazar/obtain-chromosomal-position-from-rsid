# Install and load the biomaRt package if not already installed
if (!requireNamespace("biomaRt", quietly = TRUE)) {
  install.packages("biomaRt")
}
library(biomaRt)

##Define the Ensembl database and dataset you want to query
ensembl <- useMart("ENSEMBL_MART_SNP", host = "https://www.ensembl.org")
dataset <- useDataset("hsapiens_snp", mart = ensembl)

# List of rs numbers (replace with your list)
rs_numbers <- c( "rs1019340046", "rs1021631442","rs1033725987")

# Query Ensembl to retrieve chromosomal positions
variant_info <- getBM(
  filters = "snp_filter",
  attributes = c("chr_name", "chrom_start", "chrom_end"),
  values = rs_numbers,
  mart = dataset
)

# Print the results
print(variant_info)
