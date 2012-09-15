!/usr/bin/env ruby

def divisible num, arr
	arr.each do |div|
		next if num%div == 0
		return false
	end
	return true
end

num = 0
arr = [*1..20]
step = 2*3*5*7*11*13*17*19
num = step
until divisible num, [*1..20]
	num+=step
end
puts num
