require "benchmark"
def sequence num
			 	return num/2 if num.even?
  return 3*num + 1
end

def evaluate num
  until num == 1
    num = sequence num
    num = yield num if block_given?
  end
end


Benchmark.bm do |k|

  k.report do
    longest_seq = []
    temp_seq = []
    longest_num_seq_count = 0
    longest_num = 0
    (1..1_000_000).each do |num|
      temp_seq = []
      evaluate num do |n|
        temp_seq << n
        n
      end
      longest_num, longest_num_seq_count, longest_seq = num, temp_seq.count, temp_seq if temp_seq.count > longest_num_seq_count
    end
    puts "Najdluzszy numer #{longest_num}"
    puts " Dlugosc: #{longest_num_seq_count}"
  end
end
