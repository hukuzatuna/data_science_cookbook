
# Make strength indices for comparisons. These are essentially percentile calculations.

offense$OPassStrength <- max(offense[,5]) - offense[,5]
offense$OPassStrength <- (1 - (offense$OPassStrength/max(offense$OPassStrength)))*100

offense$ORushStrength <- max(offense[,6]) - offense[,6]
offense$ORushStrength <- (1 - (offense$ORushStrength/max(offense$ORushStrength)))*100

offense$OPPGStrength <- max(offense[,3]) - offense[,3]
offense$OPPGStrength <- (1 - (offense$OPPGStrength/max(offense$OPPGStrength)))*100

offense$OYPGStrength <- max(offense[,4]) - offense[,4]
offense$OYPGStrength <- (1 - (offense$OYPGStrength/max(offense$OYPGStrength)))*100

offense$OffStrength <- (offense$OPassStrength + offense$ORushStrength + offense$OPPGStrength + offense$OYPGStrength)/4

defense$DPassStrength <- max(defense[,6]) - defense[,6]
defense$DPassStrength <- defense$DPassStrength/max(defense$DPassStrength) * 100

defense$DRushStrength <- max(defense[,5]) - defense[,5]
defense$DRushStrength <- defense$DRushStrength/max(defense$DRushStrength) * 100

defense$DPPGStrength <- max(defense[,3]) - defense[,3]
defense$DPPGStrength <- defense$DPPGStrength/max(defense$DPPGStrength) * 100

defense$DYPGStrength <- max(defense[,4]) - defense[,4]
defense$DYPGStrength <- defense$DYPGStrength/max(defense$DYPGStrength) * 100

defense$DefStrength <- (defense$DPassStrength + defense$DRushStrength + defense$DPPGStrength + defense$DYPGStrength)/4

