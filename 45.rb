class Fixnum
  def triangle?
    num = 2*self
    sqr = (num**0.5).to_i
    sqr*(sqr+1) == num
  end

  def pentagonal?
    d_1 = (1-(1+24*self)**0.5)/6
    d_2 = (1+(1+24*self)**0.5)/6
    (d_1 > 0 && d_1.to_i == d_1) || (d_2 > 0 && d_2.to_i == d_2)
  end

  def hexagonal?
    d_1 = (1-(1+8*self)**0.5)/4
    d_2 = (1+(1+8*self)**0.5)/4
    (d_1 > 0 && d_1.to_i == d_1) || (d_2 > 0 && d_2.to_i == d_2)

  end
end

cur = 40766
while true
  if cur.triangle? 
    if cur.pentagonal? 
      if cur.hexagonal?
        break
      end
    end
  end
  cur+=1 
  print "#{cur} \r"
end
p cur
