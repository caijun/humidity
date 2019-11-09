#' @title Viability of influenza A virus for 1 hour after spraying
#'
#' @description A dataset containing airborne virus particles of influenza A for viable survival in the dark at controlled temperature and relative humidity for 1 hour after spraying.
#'
#' @format A data frame with 11 rows and 3 variables:
#' \itemize{
#'   \item T: temperature in degree Celsius (7.5--32.0)
#'   \item RH: relative humidity in percentage (20--82)
#'   \item PV: percentage of viable virus (6.6--78.0)
#' }
#' @source Harper, G. J. (1961). \emph{Airborne micro-organisms: survival tests with four viruses}. Journal of Hygiene, 59(04), 479-486.
"ivs"

#' @title Aerosol transmission efficiency of influenza A virus from guinea pigs to guinea pigs
#'
#' @description A dataset containing aerosol transmission efficiency of influenza A virus from four infected guinea pigs to four exposed guinea pigs under conditions of controlled temperature and relative humidity.
#'
#' @format A data frame with 24 rows and 4 variables:
#' \itemize{
#'   \item T: temperature in degree Celsius (5--30)
#'   \item RH: relative humidity in percentage (20--80)
#'   \item PT: transmission efficiency in percentage (0--100)
#'   \item source: data source
#' }
#' @source Lowen, A. C., Mubareka, S., Steel, J., & Palese, P. (2007). \emph{Influenza virus transmission is dependent on relative humidity and temperature}. PLoS pathogens, 3(10), e151.
#'
#' Lowen, A. C., Steel, J., Mubareka, S., & Palese, P. (2008). \emph{High temperature (30℃) blocks aerosol but not contact transmission of influenza virus}. Journal of virology, 82(11), 5650-5652.
"ivt"
