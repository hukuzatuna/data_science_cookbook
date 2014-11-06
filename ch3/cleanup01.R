# Philip R. Moyer
# November 2014
# All rights reserved

rm("abr", "ABR", "def_game", "durl","game", "loser", "off_game", "ourl", "pd2", "pd3", "pd4", "pdt2", "pdt3", "pdt4", "playerdata", "players", "QB", "qbr_url", "t1", "teams", "winner")

# we have a bunch of columns that are factors, when they should be numeric or character.

offense$QB <- as.character(offense$QB)
offense$ABR <- as.character(offense$ABR)
for (i in c(21,22,23,24,25,26,27,28,29)) {
	offense[,i] <- as.double(offense[,i])
}

# Now put in values for teams that are missing quarterbacks in the data

offense$QB[is.na(offense$QB)] <- "unknown"
offense[is.na(offense)] <- 0


