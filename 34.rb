#!/usr/bin/env ruby

def fact num
				return 1 if num == 0
				num == 1 ? 1 : num*fact(num - 1)
end

curr = 11
list = []
fastfact = []
(0..9).each do |num|
				fastfact << fact(num)
end

begin
				curr += 1
				fac =  curr.to_s.split('').inject(0){|sum,cur| sum += fastfact[cur.to_i] }
				list << curr if fac == curr
end until 2000 < curr

puts list.inspect
				



