off_game <- subset(offense, Team==home_team | Team==away_team)[,c(1,15,16,19)]
def_game <- subset(defense, Team==home_team | Team==away_team)[,c(1,14,15,18)]
game <- merge(off_game, def_game, by.x="Team", by.y="Team")

game$Net_Pass[game$Team==home_team] <- game$OPassStrength[game$Team==home_team] - game$DPassStrength[game$Team==away_team]
game$Net_Pass[game$Team==away_team] <- game$OPassStrength[game$Team==away_team] - game$DPassStrength[game$Team==home_team]

game$Net_Rush[game$Team==home_team] <- game$ORushStrength[game$Team==home_team] - game$DRushStrength[game$Team==away_team]
game$Net_Rush[game$Team==away_team] <- game$ORushStrength[game$Team==away_team] - game$DRushStrength[game$Team==home_team]

game$Net_Total[game$Team==home_team] <- game$OffStrength[game$Team==home_team] - game$DefStrength[game$Team==away_team]
game$Net_Total[game$Team==away_team] <- game$OffStrength[game$Team==away_team] - game$DefStrength[game$Team==home_team]

game$Net_Total <- game$Net_Pass + game$Net_Rush + game$Net_Total
print(game)

gameConfidence <- abs(as.double(game[1,10]) - as.double(game[2,10]))
if (game$Net_Total[game$Team==home_team] >= game$Net_Total[game$Team==away_team]) {
	winner <- home_team
	loser <- away_team
} else {
	winner <- away_team
	loser <- home_team
}
print(paste(winner, "beat", loser))
print(gameConfidence)

