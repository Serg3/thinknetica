print "Введите коэффициент a: "
a = gets.chomp.to_i

print "Введите коэффициент b: "
b = gets.chomp.to_i

print "Введите коэффициент c: "
c = gets.chomp.to_i

D = b*b - 4.0*a*c

if D < 0
	puts "Корней нет!"
elsif D == 0
	puts "Корень равен: #{-b / (2.0*a)}"
else
	puts "Корень 1 равен: #{(-b + Math.sqrt(D)) / (2.0*a)}"
	puts "Корень 2 равен: #{(-b - Math.sqrt(D)) / (2.0*a)}"
end
