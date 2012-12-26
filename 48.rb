#!/usr/bin/env ruby
# encoding: utf-8

=begin rdoc
these are powers
	The series, 11 + 22 + 33 + ... + 1010 = 10405071317.

	Find the last ten digits of the series, 11 + 22 + 33 + ... + 10001000.
=end

numb = (1..1000).inject(0){|sum, num| sum+= num**num}
str = numb.to_s
puts str[-8,10]
