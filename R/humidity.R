#' @title Kelvin to Celsius conversion
#' @description convert temperature in Kelvin (K) into degree Celsius (°C)
#' @param K temperature in Kelvin (K)
#' @return numeric temperature in degree Celsius (°C)
#' @seealso \code{\link{C2K}}.
#' @author Jun Cai (\email{cai-j12@@mails.tsinghua.edu.cn}), PhD candidate from
#' Department of Earth System Science, Tsinghua University
#' @export
#' @examples
#' K2C(0)
K2C <- function(K) {
  # check parameter
  stopifnot(is.numeric(K))

  return(K - T0)
}

#' @title Celsius to Kelvin conversion
#' @description convert temperature in degree Celsius (°C) into Kelvin (K)
#' @param C temperature in degree Celsius (°C)
#' @return numeric temperature in Kelvin (K)
#' @seealso \code{\link{K2C}}.
#' @author Jun Cai (\email{cai-j12@@mails.tsinghua.edu.cn}), PhD candidate from
#' Department of Earth System Science, Tsinghua University
#' @export
#' @examples
#' T0 # absolute zero in Kelvin (K)
#' C2K(T0)
C2K <- function(C) {
  # check parameter
  stopifnot(is.numeric(C))

  return(C + T0)
}

#' @title calculate saturation vapor pressure using the Murray equation
#' @description calculate saturation vapor pressure \eqn{E_s} at temperature \eqn{t}, per the equation proposed by Murray (1967).
#' @param t temperature in Kelvin (K)
#' @return numeric saturation vapor pressure in hectopascal (hPa) or millibar (mb)
#' @references Murray, F. W. (1967). \emph{On the Computation of Saturation Vapor Pressure}. Journal of Applied Meteorology, 6(1), 203-204.
#' @seealso \code{\link{SVP.ClaCla}}, \code{\link{SVP}}.
#' @author Jun Cai (\email{cai-j12@@mails.tsinghua.edu.cn}), PhD candidate from
#' Department of Earth System Science, Tsinghua University
#' @export
#' @examples
#' T0 # absolute zero in Kelvin (K)
#' SVP.Murray(T0)
SVP.Murray <- function(t) {
  # check parameter
  stopifnot(is.numeric(t))

  if (t < T0) {
    a <- 21.8745584
    b <- 7.66
  } else {
    a <- 17.2693882
    b <- 35.86
  }
  Es <- 6.1078 * exp(a * (t - T0) / (t - b))
  return(Es)
}

#' @title calculate saturation vapor pressure using the Clausius-Clapeyron equation
#' @description calculate saturation vapor pressure \eqn{E_s} at temperature \eqn{t}, using the Clausius-Clapeyron equation.
#' @param t temperature in Kelvin (K)
#' @return numeric saturation vapor pressure in hectopascal (hPa) or millibar (mb)
#' @references Shaman, J., & Kohn, M. (2009). \emph{Absolute humidity modulates influenza survival, transmission, and seasonality}. Proceedings of the National Academy of Sciences, 106(9), 3243-3248.
#'
#' Wallace, J. M., & Hobbs, P. V. (2006). \emph{Atmospheric science: an introductory survey} (Vol. 92). Academic press.
#' @seealso \code{\link{SVP.Murray}}, \code{\link{SVP}}.
#' @author Jun Cai (\email{cai-j12@@mails.tsinghua.edu.cn}), PhD candidate from
#' Department of Earth System Science, Tsinghua University
#' @export
#' @examples
#' T0 # absolute zero in Kelvin (K)
#' SVP.ClaCla(T0)
SVP.ClaCla <- function(t) {
  # check parameter
  stopifnot(is.numeric(t))

  Es <- Es.T0 * exp((L / Rw) * (1 / T0 - 1 / t))
  return(Es)
}

#' @title calculate saturation vapor pressure
#' @description calculate saturation vapor pressure \eqn{E_s} at temperature \eqn{t}, using the Clausius-Clapeyron equation or the Murray equation.
#' @param t temperature in Kelvin (K) or in degree Celsius (°C)
#' @param isK logical indicator whether temperature is in Kelvin (K). The default value is TRUE.
#' @param formula the formula is used for calculating saturation vapor pressure. By default the Clausius-Clapeyron equation is used.
#' @return numeric saturation vapor pressure in hectopascal (hPa) or millibar (mb)
#' @seealso \code{\link{SVP.ClaCla}}, \code{\link{SVP.Murray}}.
#' @author Jun Cai (\email{cai-j12@@mails.tsinghua.edu.cn}), PhD candidate from
#' Department of Earth System Science, Tsinghua University
#' @export
#' @examples
#' SVP(273.15)
SVP <- function(t, isK = TRUE, formula = c("Clausius-Clapeyron", "Murray")) {
  # check parameters
  stopifnot(is.numeric(t))
  stopifnot(is.logical(isK))
  formula <- match.arg(formula)

  # vectorize
  if (length(t) > 1) {
    return(sapply(t, SVP))
  }

  if (isK == FALSE) {
    t <- C2K(t)
  }

  if (formula == "Clausius-Clapeyron") {
    SVP.ClaCla(t)
  } else {
    SVP.Murray(t)
  }
}

#' @title calculate partial water vapor pressure given dew point
#' @description calculate partial water vapor pressure \eqn{e} based on dew point \eqn{T_d}
#' @param Td dew point in Kelvin (K) or in degree Celsius (°C)
#' @param isK logical indicator whether temperature is in Kelvin (K). The default value is TRUE.
#' @return numeric partial vapor pressure in hectopascal (hPa) or millibar (mb)
#' @seealso \code{\link{SVP}}, \code{\link{SVP.ClaCla}}.
#' @author Jun Cai (\email{cai-j12@@mails.tsinghua.edu.cn}), PhD candidate from
#' Department of Earth System Science, Tsinghua University
#' @export
#' @examples
#' T0 # absolute zero in Kelvin (K)
#' WVP1(T0)
WVP1 <- function(Td, isK = TRUE) {
  # check parameters
  stopifnot(is.numeric(Td))

  if (isK == FALSE) {
    Td <- C2K(Td)
  }
  e <- SVP.ClaCla(Td)
  return(e)
}

#' @title calculate partial water vapor pressure given relative humidity and saturation water vapor pressure
#' @description calculate partial water vapor pressure \eqn{e} based on relative humdity \eqn{\psi} and saturation water vapor pressure at temperature \eqn{t}
#' @param psi relative humidity \eqn{\psi} in percentage (\eqn{\%})
#' @param Es saturation vapor pressure \eqn{e_s}(hPa) at temperature \eqn{t}, which can be calculated by callling \code{\link{SVP}} function.
#' @return numeric partial water vapor pressure in Pascal (Pa)
#' @seealso \code{\link{SVP}}, \code{\link{SVP.ClaCla}}, \code{\link{SVP.Murray}}.
#' @author Jun Cai (\email{cai-j12@@mails.tsinghua.edu.cn}), PhD candidate from
#' Department of Earth System Science, Tsinghua University
#' @export
#' @examples
#' Es <- SVP(273.15)
#' WVP2(70, Es)
WVP2 <- function(psi, Es) {
  # check parameters
  stopifnot(is.numeric(psi))
  stopifnot(is.numeric(Es))

  e <- psi * Es
  return(e)
}

#' @title calculate relative humidity
#' @description calculate relative humidity \eqn{\psi} based on temperature \eqn{t} and dew point \eqn{T_d}
#' @param t temperature in Kelvin (K) or in degree Celsius (°C)
#' @param Td dew point in Kelvin (K) or in degree Celsius (°C)
#' @param isK logical indicator whether temperature is in Kelvin (K). The default value is TRUE.
#' @return numeric relative humidity in %.
#' @seealso \code{\link{AH}}, \code{\link{SH}}.
#' @author Jun Cai (\email{cai-j12@@mails.tsinghua.edu.cn}), PhD candidate from
#' Department of Earth System Science, Tsinghua University
#' @export
#' @examples
#' RH(30, 15, isK = FALSE)
RH <- function(t, Td, isK = TRUE) {
  # check parameters
  stopifnot(is.numeric(t))
  stopifnot(is.numeric(Td))
  stopifnot(is.logical(isK))

  if (isK == FALSE) {
    Td <- C2K(Td)
    t <- C2K(t)
  }
  e <- SVP.ClaCla(Td)
  Es <- SVP.ClaCla(t)
  psi <- e / Es * 100
  return(psi)
}

#' @title calculate absolute humidity
#' @description calculate absolute humidity \eqn{\rho_w} based on partial water vapor pressure \eqn{e} at temperature \eqn{t}
#' @param e partial water vapor pressure in Pascal (Pa)
#' @param t temperature in Kelvin (K) or in degree Celsius (°C)
#' @param isK logical indicator whether temperature is in Kelvin (K). The default value is TRUE.
#' @return numeric absolute humidity \eqn{\rho_w} (\eqn{kg/m^3})
#' @seealso \code{\link{WVP1}}, \code{\link{WVP2}}, \code{\link{RH}}, \code{\link{SH}}.
#' @author Jun Cai (\email{cai-j12@@mails.tsinghua.edu.cn}), PhD candidate from
#' Department of Earth System Science, Tsinghua University
#' @export
#' @examples
#' t <- 273.15
#' Es <- SVP(t)
#' e <- WVP2(70, Es)
#' AH(e, t)
AH <- function(e, t, isK = TRUE) {
  # check parameters
  stopifnot(is.numeric(e))
  stopifnot(is.numeric(t))
  stopifnot(is.logical(isK))

  if (isK == FALSE) {
    t <- C2K(t)
  }
  rho_w <- e / (Rw * t)
  return(rho_w)
}

#' @title calculate specific humidity
#' @description calculate specific humidity \eqn{q} based on partial water vapor pressure \eqn{e} under given atmospheric pressure \eqn{p}
#' @param e partial water vapor pressure in Pascal (Pa)
#' @param p atmospheric pressure in Pascal (Pa). The default is standard atmospheric pressure of 101325Pa.
#' @return numeric specific humidity \eqn{q} (\eqn{kg/kg})
#' @seealso \code{\link{WVP2}}, \code{\link{WVP2}}, \code{\link{AH}}, \code{\link{RH}}, \code{\link{MR}}.
#' @author Jun Cai (\email{cai-j12@@mails.tsinghua.edu.cn}), PhD candidate from
#' Department of Earth System Science, Tsinghua University
#' @export
#' @examples
#' t <- 273.15
#' Es <- SVP(t)
#' e <- WVP2(70, Es)
#' SH(e, p = 101325)
SH <- function(e, p = 101325) {
  # check parameters
  stopifnot(is.numeric(e))
  stopifnot(is.numeric(p))

  k <- Mw / Md
  q <- k * e / (p - (1 - k) * e)
  return(q)
}

#' @title calculate mixing ratio
#' @description calculate mixing ratio \eqn{\omega} based on specific humidity \eqn{q}
#' @param q specific humidity \eqn{q} (\eqn{kg/kg})
#' @return numeric mixing ratio \eqn{\omega} (\eqn{kg/kg})
#' @seealso \code{\link{SH}}.
#' @author Jun Cai (\email{cai-j12@@mails.tsinghua.edu.cn}), PhD candidate from
#' Department of Earth System Science, Tsinghua University
#' @export
#' @examples
#' t <- 273.15
#' Es <- SVP(t)
#' e <- WVP2(70, Es)
#' q <- SH(e, p = 101325)
#' MR(q)
MR <- function(q) {
  # check parameter
  stopifnot(is.numeric(q))

  omega <- q / (1 - q)
  return(omega)
}

#' @title convert specific humidity into relative humidity
#' @description Climate models usually provide specific humidity only; however, relative humidity is used to compute \href{https://www.weather.gov/ama/heatindex}{heat index} that is really useful for health impacts studies. This function converts specific humidity \eqn{q} into relative humidity \eqn{\psi} at temperature \eqn{t} and under atmospheric pressure \eqn{q}.
#' @param q specific humidity \eqn{q} (\eqn{kg/kg})
#' @param t temperature in Kelvin (K) or in degree Celsius (°C)
#' @param p atmospheric pressure in Pascal (Pa). The default is standard atmospheric pressure of 101325Pa.
#' @param isK logical indicator whether temperature is in Kelvin (K). The default value is TRUE.
#' @return numeric relative humidity in %.
#' @seealso \code{\link{AH}}, \code{\link{SH}}.
#' @author Jun Cai (\email{cai-j12@@mails.tsinghua.edu.cn}), PhD candidate from
#' Department of Earth System Science, Tsinghua University
#' @export
#' @examples
#' SH2RH(0.005867353, 22.25, p = 101325, isK = FALSE)
SH2RH <- function(q, t, p = 101325, isK = TRUE) {
  # check parameters
  stopifnot(is.numeric(q))
  stopifnot(is.numeric(t))
  stopifnot(is.numeric(p))
  stopifnot(is.logical(isK))

  if (isK == FALSE) {
    t <- C2K(t)
  }
  e <- q * p / (0.622 + 0.378 * q) # in Pa
  Es <- SVP.ClaCla(t) # in hPa
  psi <- e / Es
  return(psi)
}
