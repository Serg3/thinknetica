print "Введите 1-ю сторону треугольника: "
side_1 = gets.chomp.to_i

print "Введите 2-ю сторону треугольника: "
side_2 = gets.chomp.to_i

print "Введите 3-ю сторону треугольника: "
side_3 = gets.chomp.to_i

if side_1 == side_2 && side_1 == side_3
	puts "Правильный треугольник!"
elsif side_1 == side_2 || side_1 == side_3 ||side_2 == side_3
	puts "Равнобедренный треугольник."
end

max_side = [side_1, side_2, side_3].max

if max_side == side_1
	theorem = side_1 * side_1 - side_2 * side_2 - side_3 * side_3
elsif max_side == side_2
	theorem = side_2 * side_2 - side_1 * side_1 - side_3 * side_3
elsif max_side == side_3
	theorem = side_3 * side_3 - side_2 * side_2 - side_1 * side_1
end

if theorem == 0
	puts "Прямоугольный треугольник."
else
	puts "Не прямоугольный треугольник."
end
