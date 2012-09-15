#!/usr/bin/env ruby

pow = 1000
num = 2**pow
puts num.to_s.split('').map(&:to_i).inject(:+)
