# humidity

[![Build Status](https://travis-ci.org/caijun/humidity.svg?branch=master)](https://travis-ci.org/caijun/humidity)
[![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/humidity)](http://cran.r-project.org/package=humidity)

humidity is an R package for calculating water vapor measures from temperature and relative humidity.

## Introduction

Vapor pressure, absolute humidity, specific humidity, and mixing ratio are commonly used water vapor measures in meteorology. This R package provides functions for calculating saturation vapor pressure (hPa), partial water vapor pressure (Pa), absolute humidity (kg/m^3), specific humidity (kg/kg), and mixing ratio (kg/kg) from temperature (K) and relative humidity (%).

## Installation

Get the released version from CRAN:

```r
install.packages("humididty")
```

Or the development version from github:

```r
# install.packages("devtools")
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
