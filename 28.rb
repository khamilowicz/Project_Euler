#!/usr/bin/env ruby

sum = 1
step = 2
curr = 1

begin
	4.times do 
					curr += step
					sum += curr
	end
	step += 2
end until step > 1001

puts sum
