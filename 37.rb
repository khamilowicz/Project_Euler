#!/usr/bin/env ruby
# encoding: utf-8

=begin rdoc
	The number 3797 has an interesting property. Being prime itself, it is possible to continuously remove digits from left to right, and remain prime at each stage: 3797, 797, 97, and 7. Similarly we can work from right to left: 3797, 379, 37, and 3.

	Find the sum of the only eleven primes that are both truncatable from left to right and right to left.

NOTE: 2, 3, 5, and 7 are not considered to be truncatable primes
=end

require "prime"
def right_prime num
  until num == 0
    return false unless num.prime?
    num/= 10
  end
  return true
end

def left_prime num	
				temp = 2
				n = 1
	until temp == num
					return false unless temp.prime?
					temp = num%10**n
					n+= 1
  end 
  return true
end

#def left_prime num	
  #temp = num.to_s.split('')
  #num_c = ''
  #begin
    #return false unless num.prime?
    #num_c << temp.pop
    #num = num_c.reverse.to_i
  #end until temp.empty?
  #return true
#end

n = 11
primes = []
while true 
	n += 2
	primes << n if right_prime(n) && left_prime(n)
	break if primes.size == 11

	print "%0.3f %% \r" % (n/8000.0)
end

puts primes.inject(:+)
