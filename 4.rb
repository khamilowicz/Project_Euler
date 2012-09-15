require 'benchmark'
@list = []
@list2 = []



Benchmark.bm { |x|
	x.report do
		999.downto(100).each do |x|
			999.downto(100) do |y|
				b = x*y
				a = b.to_s
				if a == a.reverse
					@list << b
				end
			end
		end
	end

	x.report do
		@nums = (100..999).to_a.combination(2).sort.reverse
		@nums.each do |x|
			a = x[0] * x[1]
			b = a.to_s
			if b == b.reverse
				p a
				break
			end
		end
	end
	x.report do
		999.downto(100).to_a.combination(2) do |x|
			a = x[0] * x[1]
			b = a.to_s
			if b == b.reverse
				@list2 << a
			end
		end
	end

}

puts @list.max
puts @list2.max
puts @list.size
puts @list2.size
