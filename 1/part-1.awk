#!/usr/bin/env awk

BEGIN {
	highest = 0
	sum = 0
}

/^[0-9]+/ {

	if ($1 > highest) {
		highest = $1
	}

	sum += $1
}

/^$/ {
	if (highest < sum) {
		highest = sum
	}
	sum = 0
}

END {
	print "highest: " highest
}
