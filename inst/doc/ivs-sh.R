## ------------------------------------------------------------------------
# load humidity package
library(humidity)

# display built-in 1-h influenza virus surival data
head(ivs)

## ---- message=FALSE------------------------------------------------------
# tempature in Kelvin
ivs$Tk <- C2K(ivs$T)
# saturation vapor pressure in hPa
ivs$Es <- SVP(ivs$Tk)
# partial water vapor pressure in Pa
ivs$E <- WVP(ivs$RH, ivs$Es)
# absolute humidity in kg/m^3
ivs$rho <- AH(ivs$E, ivs$Tk)
# specific humidity in kg/kg
ivs$q <- SH(ivs$E)
# mixing ratio in kg/kg
ivs$omega <- MR(ivs$q)
# display calculation results
head(ivs)

## ------------------------------------------------------------------------
# log-linear regression of 1-h infuenza A virus survival on specific humididty
loglm <- lm(log(PVV) ~ q, data = ivs)
summary(loglm)

## ---- fig.width=5.5, fig.height=5.5, fig.align='center'------------------
# get fitted value to plot regression curve
ivs$fit.val <- exp(predict(loglm))
ivs <- ivs[with(ivs, order(q)), ]

# plot percentage viable virus vs. specific humidity
par(pty = "s")
plot(x = ivs$q, y = ivs$PVV, col = "red", pch = 3, lwd = 3, 
     xaxt = "n", yaxt = "n", xlim = c(0, 0.03), ylim = c(0, 100), 
     xaxs = "i", yaxs = "i", xlab = "", ylab = "", 
     main = "Regression of Influenza A Virus Survival\n on Specific Humidity")
title(xlab = "Specific Humidity (kg/kg)", ylab = "Percent  Viable (%)", mgp = c(2, 1, 0))
# plot regression curve
lines(x = ivs$q, y = ivs$fit.val, lty = "dashed", lwd = 4)
axis(side = 1, at = seq(0, 0.03, by = 0.01), labels = c("0", "0.01", "0.02", "0.03"), 
     tck = 0.01, padj = -0.5)
axis(side = 2, at = seq(0, 100, by = 20), tck = 0.01, las = 2, hadj = 0.5)
axis(side = 3, at = seq(0, 0.03, by = 0.01), labels = FALSE, tck = 0.01)
axis(side = 4, at = seq(0, 100, by = 20), labels = FALSE, tck = 0.01)
legend(0.011, 95, legend = c("1 Hour Viability", "p < 0.0001"), pch = c(3, NA), 
       col = c("red", "black"), lty = c(NA, "dashed"), lwd = c(3, 4), seg.len = 5)

