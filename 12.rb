#!/usr/bin/env ruby

def count_divisors num
	divisors = 0
	(1..num/2).each do |div|
		divisors+= 1 if num%div==0
	end
	divisors += 1
end
out = 1
cur = 2
div = 0

until div > 500
	out += cur
	cur += 1
	puts "#{cur} #{ div}" if cur%1000==0
	div = count_divisors(out)
end

puts out
