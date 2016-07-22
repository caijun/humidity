#' @title Absolute zero
#' @description  \href{https://en.wikipedia.org/wiki/Absolute_zero}{Absolute zero} in Kelvin \eqn{T_0} (K)
#' @export
T0 <- 273.15

#' @title Saturation vapor pressure at absolute zero (hPa)
#' @description  \eqn{e_s(T_0) = 6.11hPa} is the saturation vapor pressure at the absolute zero \eqn{T_0 = 273.15K}.
#' @seealso \code{\link{T0}}
#' @export
Es.T0 <- 6.11

#' Specific gas constant of water vapor
#' @description  \href{https://en.wikipedia.org/wiki/Gas_constant#Specific_gas_constant}{Specific gas constant} of water vapor \eqn{R_w = \frac{1000R}{M_w} = 461.52J/(kgK)}, where \eqn{R = 8.3144621J/(molK)} is the molar \href{https://en.wikipedia.org/wiki/Gas_constant}{gas constant} and \eqn{M_w = 18.01528g/mol} is the molecular weight of water vapor.
#' @seealso \code{\link{Mw}}
#' @export
Rw <- 461.52

#' Molecular weight of water vapor
#' @description  \href{https://en.wikipedia.org/wiki/Molar_mass}{Molecular weight} of water vapor \eqn{M_w = 18.01528g/mol}
#' @seealso \code{\link{Md}}
#' @export
Mw <- 18.01528

#' Molecular weight of dry air
#' @description  Molecular weight of dry air \eqn{M_d = 28.9634g/mol}
#' @seealso \code{\link{Mw}}
#' @export
Md <- 28.9634

#' Latent heat of water vapor
#' @description  \href{https://en.wikipedia.org/wiki/Latent_heat}{Latent heat} of water vapor \eqn{L = 2.5 \times 10^6J/kg}
#' @export
L <- 2.5e6
