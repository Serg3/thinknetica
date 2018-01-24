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

purchases.each do |purchase, cost|
  amount = cost[:price] * cost[:quantity]
  puts "#{purchase}: #{cost[:price]} x #{cost[:quantity]} = #{amount}"
  total += amount
end

puts "---------------"
puts "Total: #{total}"
puts "---------------"
