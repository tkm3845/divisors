def factor(n)
  i=2;result=[];n0=n
  while i<=n**0.5 do
    if n%i==0 then
      result.push(i)
      n/=i
    else
      i+=1
    end
  end
  return result.push(n)
end
def checker(n)
  a=factor(n);a1=[];a2=[];c=0
  a.each_index do |i|
    if a[i]==c then
      a2[a2.length-1]+=1
    else
      a1.push(a[i]);a2.push(1);c=a[i]
    end
  end
  return [a1,a2]
end
#def divisor(n)
#  a=factor(n);t=1;s=0
#  (2**a.length).times do |i|
#    a.each_index do |j|
#      t*=a[j]**((i&2**j)/2**j)
#    end
#    s+=t;puts t;t=1
#  end
#  return s
#end
#def divisor(n)
#  a=divisor0(n);b = makebin(a); k = 0
#  b.each_index do |i|
#    b[i].times do a[k] = i; k = k + 1 end
#  end
#  return a
#end
#def makebin(a)
#  b = Array.new(a[a.length-1]+1, 0)
#  a.each do |x| b[x] = b[x] + 1 end
#  return b
#end
def divisor(n)
  if n==1 then
    return [1]
  end
  a=checker(n);n=1
  a[1].each do |x|
    n*=(x+1)
  end
  s=Array.new(n,1)
  n.times do |i|
    k=i
    a[0].each_index do |j|
      s[k]*=a[0][j]**(i.modulo(a[1][j]+1));i/=a[1][j]+1
    end
  end
  return s.sort
end
def divisor1(n)
  if n==1 then
    return [1]
  end
  a=checker(n);n=1
  a[1].each do |x|
    n*=(x+1)
  end
  s=0
  n.times do |i|
    t=1
    a[0].each_index do |j|
      t*=a[0][j]**(i.modulo(a[1][j]+1));i/=a[1][j]+1
    end
    s+=t
  end
  return s
end
def sum(n,m)
  s=1
  m.times do
    s=n*s+1
  end
  return s
end
def divisor3(n)
  a=checker(n);s1=Array.new(a.length,0);s2=1
  a[0].each_index do |i|
    s1[i]=sum(a[0][i],a[1][i])
  end
  s1.each do |x|
    s2*=x
  end
  return s2
end