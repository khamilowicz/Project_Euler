#!/usr/bin/env ruby
# encoding: utf-8

=begin rdoc
	Let d(n) be defined as the sum of proper divisors of n (numbers less than n which divide evenly into n).
	If d(a) = b and d(b) = a, where a b, then a and b are an amicable pair and each of a and b are called amicable numbers.

	For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110; therefore d(220) = 284. The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.

	Evaluate the sum of all the amicable numbers under 10000.
=end

def d num
  divisors(num).inject(:+)
end

def divisors num
  arr = []
  (1..num/2 + 1).each do |i|
    arr << i if num%i==0
  end
  arr
end

puts "OK" if d(220) == 284
puts "OK" if d(284) == 220

arr = [0]
(1...10_000).each do |num|
  arr << d(num)
end

puts arr.keep_if{|x| d(d(x)) == x}
				.delete_if{|x| x == 1 || x >= 10000}
				.delete_if{|x| x == d(x)}
				.uniq
				.each{|x| print "#{x} => #{d(x)},"}
				.inject(:+)
				
