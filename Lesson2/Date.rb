print "Enter year: "
year = gets.chomp.to_i

unless year > 0
  puts "Incorrect year!"
  return
end

print "Enter month: "
month = gets.chomp.to_i

if month < 1 || month > 12
  puts "Incorrect month!"
  return
end

arr_days = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
arr_days[1] = 29 if (year % 4 == 0 && year % 100 != 0) || year % 400 == 0

print "Enter date: "
day = gets.chomp.to_i

if day < 1 || day > arr_days[month - 1]
  puts "Incorrect day!"
  return
end

count = 0
(0...month - 1).each { |i| count += arr_days[i] }
count += day

puts "Number of day #{day}.#{month} in year #{year} is #{count}"
