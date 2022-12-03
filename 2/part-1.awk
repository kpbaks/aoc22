#!/usr/bin/env awk

# The score for a single round is the score for the shape you selected
# (1 for Rock, 2 for Paper, and 3 for Scissors) plus the score for the 
# outcome of the round (0 if you lost, 3 if 
# the round was a draw, and 6 if you won).

# A = rock
# B = paper
# C = scissors

# X = rock
# Y = paper
# Z = scissors

BEGIN {
	score = 0
	win = 6
	lose = 0
	draw = 3
	rock = 1
	paper = 2
	scissors = 3
}

/^A [XYZ]$/ {
	if ($2 == "X") {
		score += rock + draw
	} else if ($2 == "Y") {
		score += rock + lose
	} else if ($2 == "Z") {
		score += rock + win
	}
}

/^B [XYZ]$/ {
	if ($2 == "X") {
		score += paper + win
	} else if ($2 == "Y") {
		score += paper + draw
	} else if ($2 == "Z") {
		score += paper + lose
	}
}

/^C [XYZ]$/ {
	if ($2 == "X") {
		score += scissors + lose
	} else if ($2 == "Y") {
		score += scissors + win
	} else if ($2 == "Z") {
		score += scissors + draw
	}
}

END {
	print score
}


# # my paper wins against their rock
# /^A Y/ {
# 	score += paper + win
# }

# # my scissor loses against their rock
# /^A Z/ {
# 	score += paper + lose
# }

# # rock against rock is a draw
# /^A X/ {
# 	score += rock + draw
# }

# # my scissor wins against their paper
# /^B Z/ {
# 	score += scissors + win
# }

# # my rock loses against their paper
# /^B X/ {
# 	score += rock + lose
# }

# # paper against paper is a draw
# /^B Y/ {
# 	score += paper + draw
# }

# # my rock wins against their scissors
# /^C X/ {
# 	score += rock + win
# }

# # my paper loses against their scissors
# /^C Y/ {
# 	score += paper + lose
# }

# # scissors against scissors is a draw
# /^C Z/ {
# 	score += scissors + draw
# }

# # /.*/ {
# # print score
# # }

# END {
# 	print score
# }
