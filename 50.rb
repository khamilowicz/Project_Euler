#!/usr/bin/env ruby
# encoding: utf-8

require "prime"


primes = []
sum = 0

limit = 1_000_000

Prime.each do |num|
  break if sum+num>limit
  primes << num 
  sum+= num
end 

sum-=primes.shift until sum.prime? 

p sum
