#!/usr/bin/env ruby
# encoding: utf-8

require "prime"
require "set"
require "benchmark"

class Fixnum
  def itoa
    ans = []
    (1..4).each do |f|
      ans << (self%(10**f))/(10**(f-1))
    end
    ans
  end
end

class Array
  def atoi
    ans = 0
    self.reverse.each_with_index do |num, i|
      ans += num*(10**(i))
    end
		ans
  end
end

p 4316.itoa
p [4,3,4,2].atoi
Benchmark.bm do |x|
  x.report{
    ans = []
    Prime.each(10_000) do |num|
      next if num < 1000
      arr = num.to_s.split('').permutation.to_a.uniq.map(&:join).map(&:to_i).select{|n| n > 1000 && n.prime?}.sort

      arr.combination(3).each do |per|
        ans << per if per[2] - per[1] == per[1] - per[0]
      end
    end

    p ans.uniq.last.join
  }
  x.report{
    ans = []
    Prime.each(10_000) do |num|
      next if num < 1000
      arr = num.itoa.permutation.to_a.uniq.map{|i| i.atoi}.select{|n| n > 1000 && n.prime?}

      arr.combination(3).each do |per|
        ans << per if per[2] - per[1] == per[1] - per[0]
      end
    end

    p ans.uniq
  }


end
