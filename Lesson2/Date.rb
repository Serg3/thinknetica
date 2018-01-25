print "Enter year: "
y = gets.chomp.to_i

unless y > 0
  puts "Incorrect year!"
  return
end

print "Enter month: "
m = gets.chomp.to_i

if m < 1 || m > 12
  puts "Incorrect month!"
  return
end

arr_days = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
arr_days[1] = 29 if (y % 4 == 0 && y % 100 != 0) || y % 400 == 0

print "Enter date: "
d = gets.chomp.to_i

if d < 1 || d > arr_days[m - 1]
  puts "Incorrect day!"
  return
end

count = 0
(0...m - 1).each { |i| count += arr_days[i] }
count += d

puts "Number of day #{d}.#{m} in year #{y} is #{count}"
