year <- 2014				# Set the year to get the right training data
source("getdata.R")			# gets NFL team stats from Yahoo!
source("make_combined.R")		# makes combined offensive and defensive data frame
source("make_indices.R")		# makes percentile indices from performance data
source("get_qbr_data.R")		# gets quarterback rating data from ESPN and adds it to team data
source("cleanup01.R")			# Cleans up data frames and stray variables
source("make_indices_02.R")		# Calculates index for QBR statistic
away_team <- "Seattle Seahawks"		# Pick an away team
home_team <- "Philadelphia Eagles"	# Pick a home team
source("seg01.R")			# runs a game simulation
