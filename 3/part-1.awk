#!/usr/bin/env awk

# a rucksack has 2 compartments.
# A given rucksack always has the same number of items in each of its two compartments, so the first half of the characters represent items in the first compartment, while the second half of the characters represent items in the second compartment.

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

{
	# split the line into 2 equal parts
	# the first part is the items in the first compartments
	# the second part is the items in the second compartment
	l = length($0)
	if (l % 2 != 0) {
		print "Error: line length is not even"
		exit 1
	}
	compartment1 = substr($0, 1, l/2)
	compartment2 = substr($0, l/2+1, l/2)

	# filter each compartment to remove duplicates
	unique_chars_in_compartment1 = unique_str(compartment1)
	unique_chars_in_compartment2 = unique_str(compartment2)

	

	for (i = 0; i < length(unique_chars_in_compartment1); i++) {
		a = substr(unique_chars_in_compartment1, i+1, 1)

		found = str_contains_char(unique_chars_in_compartment2, a)
		if (found) {
			p = priority(a)
			sum_of_priorities += p
		}
	}
}

END {
	print "part 1: " sum_of_priorities
}
