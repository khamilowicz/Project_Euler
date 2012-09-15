#! /usr/local/bin/env ruby
#
b = (1..100).inject(:+).send(:**, 2)
p b
a = (1..100).inject(0){|res,cur| res += cur**2}
p a

p "Roznica wynosi: #{b-a}"
