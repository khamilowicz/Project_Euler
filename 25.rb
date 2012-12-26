#!/usr/bin/env ruby
# encoding: utf-8

=begin rdoc
	What is the first term in the Fibonacci sequence to contain 1000 digits?
=end

class Fib
  @@arr = [] 

  def initialize(fir=1,sec=1)
    @@arr << fir
    @@arr << sec
  end

  def next
    @@arr << @@arr[-1] + @@arr[-2]
    @@arr.last
  end

  def index
    @@arr.size
  end

  def current
    @@arr.last
  end
end

fib_seq = Fib.new

until fib_seq.current/10**999 >= 1.0 do
  fib_seq.next
end
puts "F#{fib_seq.index}: #{fib_seq.current.to_s.split('').count}"
