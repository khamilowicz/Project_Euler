#file = DATA
#a = file.readlines('sep')

#puts a.inspect

file = DATA
a = file.pos
file.each('456') do |f|
	puts f
end

file.seek(a, IO::SEEK_SET)

file.each('456') do |f|
	puts f
end
__END__

1
23
456
sep
1
23
542
