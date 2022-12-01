#!/usr/bin/env awk

BEGIN {
	highest = 0
	second_highest = 0
	third_highest = 0
	sum = 0
}

function update_highest(x) {
	if (x > highest) {
		third_highest = second_highest
		second_highest = highest
		highest = x
	} else if (x > second_highest) {
		third_highest = second_highest
		second_highest = x
	} else if (x > third_highest) {
		third_highest = x
	}
}

/^[0-9]+/ {
	sum += $1
}

/^$/ {
	update_highest(sum)
	sum = 0
}

END {
	update_highest(sum)

	print "highest:\t" highest
	print "second_highest:\t" second_highest
	print "third_highest:\t" third_highest
	total = highest + second_highest + third_highest
	print "\ntotal:\t" total
}
