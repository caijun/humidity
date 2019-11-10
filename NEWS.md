### CHANGES IN humidity VERSION 0.1.5

#### NEW FEATURES

- added package data `ivt` and updated the vignette with the log-linear regression of guinea pig airborne influenza virus transmission data on specific humidity

#### MISC

- remove unused dependency packages


### CHANGES IN humidity VERSION 0.1.4

#### MISC

- used the URLencode() result of the URL containing "<>" characters, which resulted in the Bad Request while runing `R CMD check --as-cran` command


### CHANGES IN humidity VERSION 0.1.3

#### MISC

- updated vignette [Humidity Measures](https://CRAN.R-project.org/package=humidity/vignettes/humidity-measures.html)

#### NEW FEATURES

- added SH2RH() function to convert specific humidity into relative humidity


### CHANGES IN humidity VERSION 0.1.2

#### MISC

- added vignette [Humidity Measures](https://CRAN.R-project.org/package=humidity/vignettes/humidity-measures.html)
- updated vignettes by using bibliographies and citations, and forward-pipe operator

#### NEW FEATURES

- added RH() function to calculate relative humidity based on temperature and dew point
- changed WVP() into WVP2(), and added WVP1() to calculate partial water vapor pressure given dew point


### CHANGES IN humidity VERSION 0.1.1

#### MISC

- added CITAION, NEWS files

#### BUG FIXES

- updated vignette [Regression of Influenza Virus Survival on Specific Humidity](https://CRAN.R-project.org/package=humidity/vignettes/ivs-sh.html)


### CHANGES IN humidity VERSION 0.1.0

#### NEW FEATURES

- first version of humidity

#### NOTE

- in this NEWS file, #n means the issue number on GitHub, e.g. #1 is https://github.com/caijun/humidity/issues/1

