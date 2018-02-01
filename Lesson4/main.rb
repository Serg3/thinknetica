require_relative 'station'
require_relative 'route'
require_relative 'train'
require_relative 'carriage'

def create_station
  print 'Enter station name: '
  station_name = gets.chomp
  new_station = Station.new(station_name)
  stations << new_station
  puts "Station '#{new_station.name}' created."
end

def create_train
  puts 'Types: 1 - passenger, 2 - cargo.'
  print 'Select train type: '
  train_type = gets.chomp.to_i
  print 'Enter train number: '
  train_number = gets.chomp
  new_train = PassengerTrain.new(train_number) if train_type == 1
  new_train = CargoTrain.new(train_number) if train_type == 2
  trains << new_train
  puts "#{new_train.type.capitalize} train №#{new_train.number} created." unless new_train.nil?
end

def create_route
  starting_station_name = gets.chomp
  starting_station = stations.include?(starting_station_name)
  last_station_name = gets.chomp
  last_station = stations.include?(last_station_name)
  new_route = Route.new(starting_station, last_station)
  routes << new_route
end

def create_carriage
  puts 'Types: 1 - passenger, 2 - cargo.'
  print 'Select carriage type: '
  carriage_type = gets.chomp.to_i
  print 'Enter carriage number: '
  carriage_number = gets.chomp
  new_carriage = Passengercarriage.new(train_number) if train_type == 1
  new_carriage = Cargocarriage.new(train_number) if train_type == 2
  carriages << new_carriage
  puts "#{new_carriage.type.capitalize} train №#{new_carriage.number} created." unless new_carriage.nil?
end

def add_station_to_route
  new_station_name = gets.chomp
  new_station = Station.new(new_station_name)
end

def remove_station_from_route

end

def set_route_to_train

end

def add_carriage_to_train

end

def remove_carriage_from_train

end

def move_train_forward

end

def move_train_backward

end

def list_of_stations_at_route

end

def list_of_trains_at_station

end

def make_choise
  print 'Please, make your choise: '
  gets.chomp.to_i
end

def menu
  puts '------------------------------'
  puts '1. Station actions.'
  puts '2. Route actions.'
  puts '3. Train actions.'
  puts '4. Carriage actions.'
  puts '5. Enter someone else for exit.'
  puts '------------------------------'

  choise = make_choise

  case choise
  when 1
    puts '1. Create station.'
    puts '2. List of trains at station.'
    choise = make_choise

    create_station if choise == 1
    list_of_trains_at_station if choise == 2

    menu
  when 2
    puts '1. Create route.'
    puts '2. Add station to route.'
    puts '3. Remove station from route.'
    puts '4. List of stations at route.'
    choise = make_choise

    create_route if choise == 1
    add_station_to_route if choise == 2
    remove_station_from_route if choise == 3
    list_of_stations_at_route if choise == 4

    menu
  when 3
    puts '1. Create train.'
    puts '2. Set route to train.'
    puts '5. Move train forward.'
    puts '6. Move train backward.'
    choise = make_choise

    create_train if choise == 1
    set_route_to_train if choise == 2
    move_train_forward if choise == 3
    move_train_backward if choise == 4

    menu
  when 4
    puts '1. Create carriage.'
    puts '2. Add carriage to train.'
    puts '3. Remove carriage from train.'
    choise = make_choise

    create_carriage if choise == 1
    add_carriage_to_train if choise == 2
    remove_carriage_from_train if choise == 3

    menu
  else
    puts 'Good bye!'
  end
end

stations = []
trains = []
routes = []
carriages = []

menu
