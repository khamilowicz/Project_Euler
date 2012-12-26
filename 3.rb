#! /usr/bin/env ruby

require 'open-uri'

num = 600851475143

address = 'http://www.cs.arizona.edu/icon/oddsends/primes.htm'
b = open(address).read.scan(/\d+/).map(&:to_i)

#page = open('http://www.cs.arizona.edu/icon/oddsends/primes.htm')
#a = page.read
#b = a.scan(/\d+/).map(&:to_i)
#b = a.match(/<PRE>.*<\/PRE>/m).to_s.split().map{|x| x.to_i}
#File.open('./primes.txt', 'w').write(b)

b.reverse.each do |i|
  if num%i == 0
      puts "Answer: #{i}"
      break
  end
end



