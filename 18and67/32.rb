#!/usr/bin/env ruby

numbs = [*1..9]
list = []
fir_list= []
sec_list =  []

numbs.permutation do |numbers|
	(1..7).each do |spl_pro|
		(1..7).each do |spl_eq|
						next if spl_pro + spl_eq > 8
						numbers_dup = numbers.dup
						fir = numbers_dup.shift(spl_pro).join('').to_i
						sec = numbers_dup.shift(spl_eq).join('').to_i
						eql = numbers_dup.join('').to_i
						next if eql == 0
						if fir*sec==eql
										list << eql 
										sec_list << sec
										fir_list << fir
						end
		end
	end
end

puts list.uniq.inject(:+)

comp = fir_list.zip sec_list, list

comp.each do |nums|
	puts "#{nums[0]} * #{nums[1]} = #{nums[2]} #{ nums[0]*nums[1]==nums[2]? 'OK' : 'FAIL'}"
end
