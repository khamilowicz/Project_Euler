require 'benchmark'

i = (1..500).to_a
e = i.combination(3)
Benchmark.bm {|k|
	k.report do 
		e.each do |x|
			a,b,c = x
			if x.inject(:+) == 1000
				if a**2 + b**2 == c**2
					p "odpowiedz to #{a} #{b} #{c}"
					break
				end
			end
		end
	end
	k.report do 
		e.each do |x|
			a,b,c = x
			if a+b+c == 1000
				if a**2 + b**2 == c**2
					p "odpowiedz to #{a} #{b} #{c}"
					break
				end
			end
		end
	end
	k.report do 
		e.each do |x|
			a,b,c = x
			if a**2 + b**2 == c**2
				if a+b+c == 1000
					p "odpowiedz to #{a} #{b} #{c}"
					break
				end
			end
		end
	end
}

