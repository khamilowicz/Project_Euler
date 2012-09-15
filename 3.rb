#! /usr/bin/env ruby

require 'open-uri'

num = 600851475143

page = open('http://www.cs.arizona.edu/icon/oddsends/primes.htm')

a = page.read
b = a.match(/<PRE>.*<\/PRE>/m).to_s.split().map{|x| x.to_i}
File.open('./primes.txt', 'w').write(b)
b.reverse.each do |i|
								if num%i == 0
																if b.include?(i)
																								puts "Answer: #{i}"
																								break
																end
								end
end



