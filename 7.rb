#! /usr/local/bin/env ruby

primes = [2]
i = 2

until primes.size >= 10001 do
	primes << i if primes.all? {|p| i%p != 0 }
	i+=1
end

p primes.last
