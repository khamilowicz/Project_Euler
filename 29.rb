#!/usr/bin/env ruby

# brute force
#

list = []

(2..100).each do |a|
	(2..100).each do |b|
			list << a**b
	end
end

puts list.uniq.count
puts 'OK' if list.uniq.count == 15
