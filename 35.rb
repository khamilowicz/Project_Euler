#!/usr/bin/env ruby
# encoding: utf-8

=begin rdoc
	The number, 197, is called a circular prime because all rotations of the digits: 197, 971, and 719, are themselves prime.
	There are thirteen such primes below 100: 2, 3, 5, 7, 11, 13, 17, 31, 37, 71, 73, 79, and 97.
	How many circular primes are there below one million?
=end

require "prime"
require "benchmark"

def ex2 limit
  out = []
  (1..limit).each do |num|
    catch(:isnt) do
      if num.prime?
        temp = num
        arr = []
        pow = 0
        until temp == 0
          arr << temp% (10**pow)
          temp/=10**pow
          pow+=1
        end
        arr.size.times do
          arr.rotate!
          acc = 0
          pow = 0
          arr.each {|i| acc+=i*(10**pow); pow+=1}
          throw(:isnt) unless acc.prime?
					puts "#{num} #{acc}"
        end
        out << num
				puts out
      end
    end
  end
  out
end

def ex limit
  out = []
  (1..limit).each do |num|
    catch(:isnt) do
      if num.prime?
        arr = num.to_s.split('')
        arr.size.times do
          throw(:isnt) unless arr.rotate!.join.to_i.prime?
        end
        out << num
      end
    end
  end
  out
end

puts ex2(100).inspect 

if ex2(100) ==[ 2, 3, 5, 7, 11, 13, 17, 31, 37, 71, 73, 79, 97]
  Benchmark.bm do |x|
    limit = 100_000
    x.report { ex limit }
    x.report { ex2 limit }
  end
end


#puts ex(100).inspect
#puts 'OK' if ex(100) == [ 2, 3, 5, 7, 11, 13, 17, 31, 37, 71, 73, 79, 97]
#out = ex(1_000_000)
#puts out
#puts out.count
