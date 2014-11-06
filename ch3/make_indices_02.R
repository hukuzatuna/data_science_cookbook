# Phiip R. Moyer
# November 2014
# All rights reserved

offense$OQBRStrength <- max(offense[,29])/offense[,29]
offense[Inf == offense] <- min(offense$OQBRStrength)		# fix infinities
offense$OQBRStrength <- (1 - (offense$OQBRStrength/max(offense$OQBRStrength)))*100


