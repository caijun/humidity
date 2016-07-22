ivs <- read.csv2(file = "data-raw/ivs.csv", comment.char = "#",
                 stringsAsFactors = FALSE)
names(ivs) <- c("T", "RH", "PVV")
col <- colnames(ivs)
ivs[col] <- sapply(ivs[col], as.numeric)

devtools::use_data(ivs, overwrite = TRUE)
