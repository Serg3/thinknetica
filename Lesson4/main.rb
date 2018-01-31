require_relative 'station'
require_relative 'route'
require_relative 'train'
require_relative 'carriage'

def menu
  puts '------------------------------'
  puts '1. Create station.'
  puts '2. Create train.'
  puts '3. Create route.'
  puts '4. Add station to route.'
  puts '5. Remove station from route.'
  puts '6. Set route to train.'
  puts '7. Add carriage to train.'
  puts '8. Remove carriage from train.'
  puts '9. Move train forward.'
  puts '10. Move train backward.'
  puts '11. List of stations at route.'
  puts '12. List of trains at station.'
  puts '13. Someone else for exit.'
  puts '------------------------------'

  print 'Please, make your choise: '
  choise = gets.chomp.to_i

  case choise
  when 1
    print 'Enter station name: '
    station_name = gets.chomp
    new_station = Station.new(station_name)
    puts "Station '#{new_station.name}' created."
    menu
  when 2
    print 'Enter train number: '
    train_number = gets.chomp
    print 'Enter train type: '
    train_type = gets.chomp
    new_train = CargoTrain.new(train_number, train_type.to_sym) if train_type.downcase == 'cargo'
    new_train = PassengerTrain.new(train_number, train_type.to_sym) if train_type.downcase == 'passenger'
    puts "#{new_train.type.capitalize} train №#{new_train.number} created." unless new_train.nil?
    menu
  when 3

    menu
  when 4

    menu
  when 5

    menu
  when 6

    menu
  when 7

    menu
  when 8

    menu
  when 9

    menu
  when 10

    menu
  when 11

    menu
  when 12

    menu
  else
    puts 'Good bye!'
  end
end

menu
