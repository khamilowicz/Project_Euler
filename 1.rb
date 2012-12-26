#! /usr/bin/ruby
#
require 'benchmark'
include Benchmark

n = 50

puts Benchmark.bm {  |report|

	t1 = report.report("first") do
		n.times do

			sum = 0

			[*1...1000].each do |x|
				if x%5 == 0
					sum += x
				elsif x%3 == 0
					sum += x
				end
			end

		end
	end

	t2 = report.report("second")do
		n.times do

			a = 999/5
			b = 999/3
			c = 999/15
			sum =   [*1..a].map{|x| x*5}.inject(:+) +
				[*1..b].map{|x| x*3}.inject(:+) -
				[*1..c].map{|x| x*15}.inject(:+)

		end
	end

	t3 = report.report("third") do

		n.times do

			sum =			[*1..999/5].inject(:+)*5 +
								[*1..999/3].inject(:+)*3 -
								[*1..999/15].inject(:+)*15

		end

	end

	t4 = report.report("fourth") do
		n.times do
						sum = [*1..999].keep_if{|i| i%3 == 0 || i%5 == 0}.inject(:+)
		end
	end

}
