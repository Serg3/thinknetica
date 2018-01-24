puts "Enter 'stop' when you finish."

purchases = {}

loop do
  print "Enter you purchase: "
  purchase = gets.chomp
  break if purchase == "stop"

  print "Enter price: "
  price = gets.chomp.to_f

  print "Enter quantity: "
  quantity = gets.chomp.to_f
  
  if price > 0 && quantity > 0
    purchases[purchase] = { price: price, quantity: quantity}
  else
    puts "Incorrect values! Purchase doesn't save!"
  end

end

if purchases.empty?
  puts "List is empty."
  return
else
  puts "------------------"
  puts "List of purchases:"
  puts "------------------"
end

total = 0

purchases.each { |k, v|
  amount = v[:price] * v[:quantity]
  puts "#{k}: #{v[:price]} x #{v[:quantity]} = #{amount}"
  total += amount
}

puts "---------------"
puts "Total: #{total}"
puts "---------------"