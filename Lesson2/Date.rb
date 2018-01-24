print "Enter date: "
d = gets.chomp.to_i

print "Enter month: "
m = gets.chomp.to_i

print "Enter year: "
y = gets.chomp.to_i

if d < 0 || m < 0 || y < 1 || d > 31 || m > 12
  puts "Incorrect date!"
  return
end

arr_days = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
arr_days[1] = 29 if y % 4 == 0 || y % 400 == 0

count = 0
for i in 1...m
  count += arr_days[i]
end
count += d

puts "Number of day #{d}.#{m} in year #{y} is #{count}"