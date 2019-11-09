# 1-h influenza virus survival data
ivs <- read.csv(file = "data-raw/ivs.csv", comment.char = "#",
                 stringsAsFactors = FALSE)
names(ivs) <- c("T", "RH", "PV")

usethis::use_data(ivs, overwrite = TRUE)

# guinea pig airborne influenza virus transmission data
ivt <- read.csv(file = "data-raw/ivt.csv", comment.char = "#",
                stringsAsFactors = FALSE)
names(ivt) <- c("T", "RH", "PT", "source")
cols <- c("T", "RH", "PT")
ivt[cols] <- sapply(ivt[cols], as.numeric)


usethis::use_data(ivt, overwrite = TRUE)
