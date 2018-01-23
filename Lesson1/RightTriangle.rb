def theorem a, b, c

  if c ** 2 == a ** 2 + b ** 2
    puts "Прямоугольный треугольник."
  else
    puts "Не прямоугольный треугольник."
  end

end

def correctness a, b, c

  if a + b > c
    true
  else
    false
  end

end

print "Введите 1-ю сторону треугольника: "
side_1 = gets.chomp.to_f

print "Введите 2-ю сторону треугольника: "
side_2 = gets.chomp.to_f

print "Введите 3-ю сторону треугольника: "
side_3 = gets.chomp.to_f

correct1 = correctness side_1, side_2, side_3
correct2 = correctness side_1, side_3, side_2
correct3 = correctness side_2, side_3, side_1

if correct1 && correct2 && correct3

  if side_1 == side_2 && side_1 == side_3
  	puts "Правильный треугольник!"
  elsif side_1 == side_2 || side_1 == side_3 ||side_2 == side_3
  	puts "Равнобедренный треугольник."
  end

  max_side = [side_1, side_2, side_3].max

  if max_side == side_1
  	theorem side_2, side_3, side_1
  elsif max_side == side_2
  	theorem side_1, side_3, side_2
  elsif max_side == side_3
  	theorem side_1, side_2, side_3
  end

else

  puts "С заданными сторонами треугольника не существует!"

end
