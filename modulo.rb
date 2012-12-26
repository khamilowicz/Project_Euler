#!/usr/bin/env ruby
# encoding: utf-8

=begin rdoc
	test different implementation of modulo
=end

require "benchmark"

Benchmark.bm{|x|

				x.report{
				(1..1000).each do |num|
					num%4
				end
				}
				x.report{
								(1..1000).each do |num|
								num/4.0 == num/4
								end
				}
}
