print "Введите коэффициент a: "
a = gets.chomp.to_f

print "Введите коэффициент b: "
b = gets.chomp.to_f

print "Введите коэффициент c: "
c = gets.chomp.to_f

D = b * b - 4 * a * c

if D < 0
	puts "Корней нет!"
elsif D == 0
	puts "Корень равен: #{-b / (2 * a)}"
else
  sqrt = Math.sqrt(D)
  
	puts "Корень 1 равен: #{(-b + sqrt) / (2 * a)}"
	puts "Корень 2 равен: #{(-b - sqrt) / (2 * a)}"
end
