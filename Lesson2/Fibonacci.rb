arr = [0, 1]

f_n = 1

while f_n < 100
  arr << f_n
  f_n = arr[-1] + arr[-2]
end

puts arr
