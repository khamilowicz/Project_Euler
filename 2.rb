#! /usr/bin/env ruby
#
require 'benchmark'

def fib lim
	sum = [1,1]
	sum << sum[-1] + sum[-2] until sum.last >= lim
	sum[0..-2]
end

sum = 0
fiba = fib 4_000_000

puts Benchmark.bm { |x|

	x.report {fiba.each {|x| sum +=x if x%2 == 0}}
}

p sum


