#!/usr/bin/env ruby
# encoding: utf-8

=begin rdoc
	Euler published the remarkable quadratic formula:

	n² + n + 41

	It turns out that the formula will produce 40 primes for the consecutive values n = 0 to 39. However, when n = 40, 402 + 40 + 41 = 40(40 + 1) + 41 is divisible by 41, and certainly when n = 41, 41² + 41 + 41 is clearly divisible by 41.

	Using computers, the incredible formula n² 79n + 1601 was discovered, which produces 80 primes for the consecutive values n = 0 to 79. The product of the coefficients, 79 and 1601, is 126479.

	Considering quadratics of the form:

	n² + an + b, where |a| 999 and |b| 999

	where |n| is the modulus/absolute value of n
	e.g. |11| = 11 and |4| = 4
	Find the product of the coefficients, a and b, for the quadratic expression that produces the maximum number of primes for consecutive values of n, starting with n = 0.
=end

require "prime"

max_primes = 0
(-999..999).each do |a|
  (-999..999).each do |b|
    n = 0
    while true
      curr_num = n*(a + n) + b
			break if curr_num <=1
      break if curr_num.even?
      break unless curr_num.prime?
      n += 1
    end
    max_primes, @max_a, @max_b = n, a, b if max_primes <= n 
  end
	percent = (1000+a)/20.0
	done = percent/10
	print "[#{'='*done.floor}#{'*'*(10-done.ceil)}] %5.1f %% \r" % percent
end

puts "a: #{@max_a}, b: #{@max_b}, n:#{max_primes}, product: #{@max_b*@max_a}"


