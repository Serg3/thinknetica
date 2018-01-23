print "Как Вас зовут? "
first_name = gets.chomp.capitalize

print "Какой у Вас рост в см? "
height = gets.chomp.to_f

weight = height - 110

if weight < 0
  puts "#{first_name}, Ваш вес уже оптимальный!"
else
	puts "#{first_name}, Ваш идеальный вес #{weight}."
end