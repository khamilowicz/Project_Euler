#!/usr/bin/env ruby
# encoding: utf-8

=begin rdoc
	The fraction 49/98 is a curious fraction, as an inexperienced mathematician in attempting to simplify it may incorrectly believe that 49/98 = 4/8, which is correct, is obtained by cancelling the 9s.

	We shall consider fractions like, 30/50 = 3/5, to be trivial examples.

	There are exactly four non-trivial examples of this type of fraction, less than one in value, and containing two digits in the numerator and denominator.

	If the product of these four fractions is given in its lowest common terms, find the value of the denominator.
=end

ans = []
ansn = []
(11...100).each do |denominator|
  (11...denominator).each do |numerator|
      next if numerator%10 == 0 || denominator%10 == 0

      left = numerator.to_f/denominator.to_f
			a,b = [numerator, denominator].map{|i| i.to_s.split('')}

			d = a.delete_if{|i| b.delete i}.join('').to_f
			e = b.join('').to_f

			right = d/e

			ansn << [numerator, denominator] if left == right && [numerator, denominator] != [d,e]



      #a,b = numerator.to_s.split('').map(&:to_f)
      #c,d = denominator.to_s.split('').map(&:to_f)

      #right = case
      #when a == c
      #b/d
      #when a == d
      #b/c
      #when b == c
      #a/d
      #when b == d
      #a/c
      #end
      #ansn << [numerator, denominator] if left == right 
  end
end

puts ansn.inspect

num = 1
dem = 1
ansn.each do |a|
  num*=a.first
  dem*=a.last
end

puts dem.to_f/num.to_f
