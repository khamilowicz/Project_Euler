#!/usr/bin/env ruby
# encoding: utf-8

=begin rdoc
	Find the sum of all the numbers that can be written as the sum of fifth powers of their digits.
=end

require "benchmark"

def to_digit_array num
  n = 1
  arr = []
  until num == 0
    a = num%10**n
    num-= a
    arr << a/10**(n-1)
    n+=1
  end
  arr
end

def to_digit_array_sec num
  arr = []
  until num == 0
    arr << num - (num/10)*10
    num/=10
  end
  arr
end

pents = []

(2..200_000).each do |num|
	pents << num if to_digit_array_sec(num).inject(0){|sum, digit| digit.to_i**5 + sum} == num
end
puts pents.inject(:+)

__END__

Benchmark.bm{|x|
  x.report{
					10.times{
    pents = []

    (2..10_000).each do |num|
      pents << num if to_digit_array_sec(num).inject(0){|sum, digit| digit.to_i**4 + sum} == num
    end
    puts pents.inspect
	}
  }
  x.report{
					10.times{
    pents = []

    (2..10_000).each do |num|
      pents << num if to_digit_array(num).inject(0){|sum, digit| digit.to_i**4 + sum} == num
    end
    puts pents.inspect
	}
  }
  x.report{
10.times{
    pents = []
    (2..10_000).each do |num|
      pents << num if num.to_s.split('').inject(0){|sum, digit| digit.to_i**4 + sum} == num
    end
    puts pents.inspect
  }
	}
}

