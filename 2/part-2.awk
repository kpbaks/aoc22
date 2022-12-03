#!/usr/bin/env awk

function id2number(id) {
	if (id == "A" || id == "X") return 0
	if (id == "B" || id == "Y") return 1
	if (id == "C" || id == "Z") return 2
}

function win(p) {
	number = (id2number(p) + 3 + 1) % 3
	if (number == 0) return "X"
	if (number == 1) return "Y"
	if (number == 2) return "Z"
}

function lose(p) {
	number = (id2number(p) + 3 - 1) % 3
	if (number == 0) return "X"
	if (number == 1) return "Y"
	if (number == 2) return "Z"
}

function draw(p) {
	if (p == "A") return "X"
	if (p == "B") return "Y"
	if (p == "C") return "Z"
}

function value_of_your_play(p) {
	if (p == "X") return 1
	if (p == "Y") return 2
	if (p == "Z") return 3
}

BEGIN {
	score = 0
}

/^[ABC] [XYZ]$/ {
	if ($2 == "X") {
		score += 0 + value_of_your_play(lose($1))
	}
	if ($2 == "Y") {
		score += 3 + value_of_your_play(draw($1))
	}
	if ($2 == "Z") {
		score += 6 + value_of_your_play(win($1))
	}
}

END {
	print score
}
