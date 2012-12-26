#!/usr/bin/env ruby

require "prime"

def count_divisors num
  divisors = 0
  (1..num**0.5).each do |div|
    divisors+= 1 if num%div==0
  end
  divisors += 1
end

def count_divisors_2 num
  temp = num
  divisors = 0 
  curr_prime = 2
  until temp == 1
    if temp%curr_prime == 0
      temp/=curr_prime
      divisors += 1
    else
      curr_prime = next_prime curr_prime
    end
  end

	return sum_of_combinations divisors
end

def sum_of_combinations size
  k = 1
  sum = 0
  until k == size+1
					sum += binomial(size,k)
					k+=1
  end
	sum
end

def binomial n,k
				fact_with_limit(n,n+1-k)/fact_with_limit(k)
end

def fact_with_limit up, down=1
  if up==down
    return down
  else
    return up*fact_with_limit(up-1, down)
  end

end

def next_prime prime
  prime += 1
  prime+=1 until prime.prime?
  prime
end
out = 1
cur = 2
div = 0

puts count_divisors_2 3
puts count_divisors_2 6
puts count_divisors_2 10
puts count_divisors_2 15
puts count_divisors_2 21
puts count_divisors_2 28

#puts fact_with_limit(52,52-4)/fact_with_limit(5)

#while true
#out += cur
#cur += 1
#div = count_divisors(out)
#puts "#{out} #{ div}" 
#break if div > 500
#end

puts out
