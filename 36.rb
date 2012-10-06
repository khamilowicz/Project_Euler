#!/usr/bin/env ruby
# encoding: utf-8

def to_binary num

  out = "";
  until num==1
    out += (num%2).to_s
    num/=2
  end
  out += "1"
  out.reverse
end

puts to_binary 8
puts 'OK' if to_binary(8) == "1000"
puts to_binary 9
puts 'OK' if to_binary(9) == "1001"
puts to_binary 10
puts 'OK' if to_binary(10) == "1010"

sum = 0
(1...1_000_000).each do |num|

  num_s = num.to_s
  if num_s == num_s.reverse
    num_s = num.to_s(2)
    if num_s == num_s.reverse
      sum += num
      puts num
    end
  end


end

puts "LICZBA"
puts sum
