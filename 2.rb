#! /usr/bin/env ruby
#
require 'benchmark'

def fib lim
	sum = [1,1]
	sum << sum[-1] + sum[-2] until sum.last >= lim
	sum[0..-2]
end

sum = 0
sum1 = 0
sum2 = 0
fiba = fib 4_000_000

puts Benchmark.bm { |x|

	x.report('first') {fiba.each {|x| sum +=x if x%2 == 0}}
	x.report('third') {sum2 = fiba.inject(0){|sum, x| sum += (x%2 == 0)?x:0}}
	x.report('second') { sum1 = fiba.select(&:even?).inject(:+)}
}

p sum
p sum1
p sum2


