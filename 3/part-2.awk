#!/usr/bin/env awk

function priority(item) {
	# a = 1
	# b = 2
	# c = 3
	# ...
	# z = 26
	# A = 27
	# B = 28
	# C = 29
	# ...
	# Z = 52
	return index("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ", item)
}

function unique_str(str) {
	# return a string with only unique characters
	# e.g. "ababab" -> "ab"
	uniques = ""
	for (i = 1; i <= length(str); i++) {
		char = substr(str, i, 1)
		if (index(uniques, char) == 0) {
			uniques = uniques char
		}
	}
	return uniques
}

function str_contains_char(str, char) {
	return index(str, char) != 0
}

BEGIN {
	sum_of_priorities = 0
}

# group every 3 consecutive lines into a single record
NR % 3 == 1 {
	rucksacks[1] = $0
}

NR % 3 == 2 {
	rucksacks[2] = $0
}

NR % 3 == 0 {
	rucksacks[3] = $0

	# find the character that appears in all 3 rucksacks
	# and add its priority to the sum
	for (i = 1; i <= length(rucksacks[1]); i++) {
		char = substr(rucksacks[1], i, 1)
		if (str_contains_char(rucksacks[2], char) && str_contains_char(rucksacks[3], char)) {
			p = priority(char)
			print "Found character " char " with priority " p
			sum_of_priorities += p
			break
		}
	}
}

END {
	print "part 2: " sum_of_priorities
}
