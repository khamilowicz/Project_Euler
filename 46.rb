#!/usr/bin/env ruby
# encoding: utf-8

=begin rdoc
	It was proposed by Christian Goldbach that every odd composite number can be written as the sum of a prime and twice a square.

	9 = 7 + 212
	15 = 7 + 222
	21 = 3 + 232
	25 = 7 + 232
	27 = 19 + 222
	33 = 31 + 212

	It turns out that the conjecture was false.

	What is the smallest odd composite that cannot be written as the sum of a prime and twice a square?
=end


require "prime"
flag = false
cur = 1
until flag
  cur += 2
  print cur
  print "\r"
  Prime.each(cur) do |cur_prime|
    flag = true
    try_it = ((cur - cur_prime).to_f/2.0)**0.5
    if try_it == try_it.to_i
      flag = false 
      break
    end
  end
end

p cur
