require 'prime'
def divisible num, arr
	arr.each do |div|
		return true if num%div==0
	end
	return false
end

#primes = [2]
#(3..2_000_000).step(2).each do |i| 
	#primes << i unless divisible(i, primes) 
#end
primes = [2]
(3..2_000_000).step(2).each do |i| 
	primes << i if i.prime?
end
puts primes.inspect
puts primes.inject(:+)

