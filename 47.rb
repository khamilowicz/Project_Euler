#!/usr/bin/env ruby
# encoding: utf-8


=begin rdoc
	The first two consecutive numbers to have two distinct prime factors are:

	14 = 2*7
	15 = 3*5

	The first three consecutive numbers to have three distinct prime factors are:

 644 = 2²*7*23
	645 = 3*5*43
	646 = 2*17*19.

 Find the first four consecutive integers to have four distinct primes factors. What is the first of these numbers?
=end

require "prime"
require "set"
require "benchmark"


curr = 1
limit = 4
nums = []
all_div = []

Benchmark.bm do |x|
  x.report {
    curr = 1
    nums = []
		all_div = []
		limit.times { all_div << [0] }
    loop do
      curr +=1
			print "#{curr.to_f/140_0}\r"

      all_div_s = Set.new

      all_div.shift
      all_div << (curr+limit-1).prime_division

      all_div.each do |div_arr|
        div_arr.each do |div_pair|
          all_div_s << div_pair
        end
      end

      break if all_div_s.size == limit**2
    end
		puts

    puts curr
  }

  x.report {
    curr = 1
    nums = []
		all_div = []
		limit.times { all_div << [0] }
      all_div_s = Set.new
    loop do
      curr +=1
			print "#{curr.to_f/140_0}\r"

      all_div_s.clear

      all_div.shift
      all_div << (curr+limit-1).prime_division

      all_div.each do |div_arr|
        div_arr.each do |div_pair|
          all_div_s << div_pair
        end
      end

      break if all_div_s.size == limit**2
    end
		puts

    puts curr
  }

end
