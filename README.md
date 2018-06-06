# humidity

[![Build Status](https://travis-ci.org/caijun/humidity.svg?branch=master)](https://travis-ci.org/caijun/humidity)
[![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/humidity)](https://CRAN.R-project.org/package=humidity)
[![rstudio mirror downloads](http://cranlogs.r-pkg.org/badges/humidity)](https://github.com/metacran/cranlogs.app)

humidity is an R package for calculating water vapor measures from temperature and dew point.

## Introduction

Vapor pressure, relative humidity, absolute humidity, specific humidity, and mixing ratio are commonly used water vapor measures in meteorology. This R package provides functions for calculating saturation vapor pressure (hPa), partial water vapor pressure (Pa), relative humidity (%), absolute humidity (kg/m^3), specific humidity (kg/kg), and mixing ratio (kg/kg) from temperature (K) and dew point (K). Conversion functions between humidity measures are also provided.

## Installation

Get the released version from CRAN:

```r
install.packages("humididty")
```

Or the development version from github:

```r
if (!requireNamespace("devtools")) install.packages("devtools")
devtools::install_github("caijun/humidity", build_vignettes = TRUE)
```

## Tutorial
To get started with **humidity** package, view available vignettes in the package:

```r
browseVignettes("humidity")
```

## Contact

Bugs and feature requests can be filed to
<https://github.com/caijun/humidity/issues>. Pull requests are also welcome.
