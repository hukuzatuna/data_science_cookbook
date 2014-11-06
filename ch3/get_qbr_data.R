# Philip R. Moyer
# November 2014
# All rights reserved.


# ESPN uses team abbreviations, while Yahoo uses team names.
# Load the team name mappings.

# http://espn.go.com/nfl/qbr/_/type/team-season
teamMap <- read.csv("team_map.csv", header=TRUE, stringsAsFactors=FALSE)

# Read the quarterback rating (QBR) data from ESPN

qbr_url <- "http://espn.go.com/nfl/qbr"
qbrdata <- readHTMLTable(qbr_url, encodeing = "UTF-8", colClasses="character", as.data.frame=TRUE, stringsAsFactors=FALSE)[[1]]

# Remove redundant headers

qbrdata <- qbrdata[-33,]
qbrdata <- qbrdata[-22,]
qbrdata <- qbrdata[-11,]

# PLAYER is a factor

qbrdata$PLAYER <- as.character(qbrdata$PLAYER)

playerdata <- strsplit(qbrdata$PLAYER, ", ")
pd2 <- as.data.frame(playerdata)

# Transpose the data frame

pd2 <- t(pd2)
rownames(pd2) <- NULL	# strip off the row name concatenations

# XXX

QB <- pd2[,1]
ABR <- pd2[,2]

pd3 <- as.data.frame(QB, ABR)
pd3$ABR <- ABR
rownames(pd3) <- NULL	# Now we have a data frame, pd3, with the team abbreviation and the QB name

# Make a merged data frame with the player names and teams

pd4 <- merge(pd3, teamMap, by.x="ABR", by.y="ABR", all=TRUE)
# pd4 now has the team abbreviation, team name, and quarterback name

# Add the abbreviation and the player/team names to the player data

qbrdata <- cbind(qbrdata, ABR)
qbrdata <- merge(qbrdata, pd4, by.x="ABR", by.y="ABR", all=TRUE)

# Now merge the player data with the offensive performance statistics

offense <- merge(offense, qbrdata, by.x="Team", by.y="Team", all=TRUE)
offense$RK <- NULL
offense$PLAYER <- NULL

