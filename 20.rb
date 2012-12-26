#!/usr/bin/env ruby
# encoding: utf-8

=begin rdoc
	Find the sum of the digits in the number 100!
=end

arr = [*1..100]
tenth = []

i = 0
j = 0
while i < 100
  ai = arr[i]
  while j < 100
    aj = arr[j]
    if (ai*aj)%10 ==0
      puts ai*aj
      tenth << ai
      tenth << aj
      arr[i] = 1
      arr[j] = 1
    end
    j+= 1
  end
  j=0
  i+=1
  puts "I = #{i}"
end
puts arr.inspect
puts arr.inject(:*).to_s.split('').map{|x| x.to_i}.inject(:+)
puts tenth.inspect
puts tenth.inject(:*)

puts "Inne"
puts [*1..100].inject(:*).to_s.split('').map{|x| x.to_i}.inject(:+)
