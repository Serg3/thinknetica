arr = [0, 1]

loop do
  f_n = arr[-1] + arr[-2]
  break if f_n >100
  arr << f_n
end

puts arr
