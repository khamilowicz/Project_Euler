#! /usr/bin/ruby
#
require 'benchmark'
include Benchmark

n = 1

puts Benchmark.bm {  |report|

	t1 = report.report do
		n.times do

			sum = 0

			[*1...1000].each do |x|
				if x%5 == 0
					sum += x
				elsif x%3 == 0
					sum += x
				end
			end
				puts sum

		end
	end

	t2 = report.report do
		n.times do

			a = 999/5
			b = 999/3
			c = 999/15
			sum =   [*1..a].map{|x| x*5}.inject(:+) +
				[*1..b].map{|x| x*3}.inject(:+) -
				[*1..c].map{|x| x*15}.inject(:+)

		end
	end

	t3 = report.report do

		n.times do

			sum =			[*1..999/5].inject(:+)*5 +
				[*1..999/3].inject(:+)*3 -
				[*1..999/15].inject(:+)*15

		end
	end
	[(t1+t2+t3)/50]

}
