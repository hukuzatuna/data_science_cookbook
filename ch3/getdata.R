library(XML)
library(RSQLite)
library(stringr)
library(ggplot2)

# Variable year should be set in environment

# Get offense data

ourl <- paste("http://sports.yahoo.com/nfl/stats/byteam?group=Offense&cat=Total&conference=NFL&year=season_",year,"&sort=530&old_category=Total&old_group=Offense")
offense <- readHTMLTable(ourl, encodeing = "UTF-8", colClasses="character")[[7]]

offense <- offense[,-c(2,4,6,8,10,12,14,16,18,20,22,24,26,28)]
offense[,1] <- as.character(offense[,1])
offense[,2:13] <- apply(offense[,2:13],2,as.numeric)
# translate possession time into seconds
offense[,14] <- as.numeric(substr(offense[,14], 1, 2))*60 + as.numeric(substr(offense[,14], 4, 6))

# Get defense data

durl <- paste("http://sports.yahoo.com/nfl/stats/byteam?group=Defense&cat=Total&conference=NFL&year=season_",year,"&sort=530&old_category=Total&old_group=Defense")
defense  <- readHTMLTable(durl, encodeing = "UTF-8", colClasses="character")[[7]]

defense <- defense[,-c(2,4,6,8,10,12,14,16,18,20,22,24,26)]
defense[,1] <- as.character(defense[,1])
defense[,2:13] <- apply(defense[,2:13], 2, as.numeric)


