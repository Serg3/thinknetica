require_relative 'manufacturer'
require_relative 'instance_counter'
require_relative 'accessor'
require_relative 'validation'
require_relative 'rail_road'
require_relative 'station'
require_relative 'route'
require_relative 'train'
require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'carriage'
require_relative 'passenger_carriage'
require_relative 'cargo_carriage'

# FOR MODULE 6 ----------------------------------

# p "Train count: #{PassengerTrain.instances}"
# train = PassengerTrain.new('555-gg', 1)
# p "Train count: #{PassengerTrain.instances}"
# p "Train company: #{train.company}"
# train.company = "Train company"
# p "Train company: #{train.company}"
#
# p "-----"
#
# p PassengerTrain.find('555')
#
# p "-----"
#
# p "Carriage count: #{CargoCarriage.instances}"
# carriage = CargoCarriage.new('555', 2)
# p "Carriage count: #{CargoCarriage.instances}"
# p "Carriage company: #{carriage.company}"
# carriage.company = "Carriage company"
# p "Carriage company: #{carriage.company}"
#
# p "-----"
#
# p "Station count: #{Station.instances}"
# station_1 = Station.new("station_1")
# station_2 = Station.new("station_2")
# p "Station count: #{Station.instances}"
#
# p "-----"
#
# Station.all.each { |station| puts station }
#
# p "-----"
#
# p "Route count: #{Route.instances}"
# Route.new(station_1, station_2)
# p "Route count: #{Route.instances}"

# FOR MODULE 8 ----------------------------------

# pc = PassengerCarriage.new('555', 1, 67)
# p "Free: #{pc.free_space}, Taken: #{pc.taken_space}"
# 70.times { pc.add_passenger_to_carriage }
# p "Free: #{pc.free_space}, Taken: #{pc.taken_space}"
#
# p "----------------"
#
# cc = CargoCarriage.new('333', 2, 184.3)
# p "Free: #{cc.free_space}, Taken: #{cc.taken_space}"
# 4.times { cc.load_carriage(50) }
# p "Free: #{cc.free_space}, Taken: #{cc.taken_space}"
# cc.load_carriage(34.31)
# p "Free: #{cc.free_space}, Taken: #{cc.taken_space}"
# cc.load_carriage(34.3)
# p "Free: #{cc.free_space}, Taken: #{cc.taken_space}"

rail_controller = RailRoad.new

# 3.times { |x| rail_controller.stations << Station.new("Station_#{x}") }
#
# rail_controller.trains << PassengerTrain.new("555-55", :passenger)
# rail_controller.trains << PassengerTrain.new("55555", :passenger)
# rail_controller.trains << CargoTrain.new("333-33", :cargo)
# rail_controller.trains << CargoTrain.new("33333", :cargo)
#
# rail_controller.stations[0].arrival(rail_controller.trains[0])
# rail_controller.stations[0].arrival(rail_controller.trains[2])
# rail_controller.stations[1].arrival(rail_controller.trains[1])
# rail_controller.stations[2].arrival(rail_controller.trains[3])
#
# rail_controller.carriages << PassengerCarriage.new("132", :passenger, 67)
# rail_controller.carriages << PassengerCarriage.new("134", :passenger, 65)
# rail_controller.carriages << PassengerCarriage.new("987", :passenger, 65)
# rail_controller.carriages << PassengerCarriage.new("456", :passenger, 67)
# rail_controller.carriages << PassengerCarriage.new("742", :passenger, 67)
# rail_controller.carriages << CargoCarriage.new("57", :cargo, 158.6)
# rail_controller.carriages << CargoCarriage.new("29", :cargo, 158.6)
# rail_controller.carriages << CargoCarriage.new("41", :cargo, 126.4)
# rail_controller.carriages << CargoCarriage.new("83", :cargo, 126.4)
# rail_controller.carriages << CargoCarriage.new("68", :cargo, 158.6)
#
# rail_controller.trains[0].add_carriage(rail_controller.carriages[0])
# rail_controller.trains[0].add_carriage(rail_controller.carriages[1])
# rail_controller.trains[1].add_carriage(rail_controller.carriages[2])
# rail_controller.trains[1].add_carriage(rail_controller.carriages[3])
# rail_controller.trains[1].add_carriage(rail_controller.carriages[4])
# rail_controller.trains[2].add_carriage(rail_controller.carriages[5])
# rail_controller.trains[2].add_carriage(rail_controller.carriages[6])
# rail_controller.trains[2].add_carriage(rail_controller.carriages[7])
# rail_controller.trains[2].add_carriage(rail_controller.carriages[8])
# rail_controller.trains[3].add_carriage(rail_controller.carriages[9])
#
# rail_controller.carriages[0].load_carriage
# 2.times { rail_controller.carriages[2].load_carriage }
# 3.times { rail_controller.carriages[3].load_carriage }
# rail_controller.carriages[5].load_carriage(58.6)
# rail_controller.carriages[8].load_carriage(100)
# rail_controller.carriages[9].load_carriage(58.6)
# rail_controller.carriages[9].load_carriage(50)

#rail_controller.stations_trains_carriages

# FOR MODULE 10 ----------------------------------

Train.attr_accessor_with_history("new_var_1", "new_var_2")

train = PassengerTrain.new("555-55", :passenger)

p "History_1: #{train.new_var_1_history}, new_var_1: #{train.new_var_1}"
p "History_2: #{train.new_var_2_history}, new_var_2: #{train.new_var_2}"
train.new_var_1 = 1
train.new_var_2 = 2
p "History_1: #{train.new_var_1_history}, new_var_1: #{train.new_var_1}"
p "History_2: #{train.new_var_2_history}, new_var_2: #{train.new_var_2}"
train.new_var_1 = 11
train.new_var_2 = 22
p "History_1: #{train.new_var_1_history}, new_var_1: #{train.new_var_1}"
p "History_2: #{train.new_var_2_history}, new_var_2: #{train.new_var_2}"

p "---"

Train.strong_attr_acessor("strong_var", PassengerCarriage)

begin
  train.strong_var = PassengerCarriage.new("654-g", :passenger, 68)
  p "Strong_var: '#{train.strong_var.number}' of '#{train.strong_var.type}' type."
rescue => message
  p message
end

begin
  train.strong_var = CargoCarriage.new("546956", :cargo, 175.6)
  p "Strong_var: '#{train.strong_var.number}' of '#{train.strong_var.type}' type."
rescue => message
  p message
end

p "---------- VALIDATIONS ----------"

begin
  station_1 = Station.new("station_1")
  p "Validate for #{station_1} successful."
  station_1 = Station.new(:station_1)
rescue => message
    p message
end

p "---"

begin
  route = Route.new(Station.new("station_2"), Station.new("station_3"))
  p "Validate for #{route} successful."
  route = Route.new("station_2", Station.new("station_3"))
rescue => message
    p message
end

p "---"

begin
  train = CargoTrain.new("55555-hgf55", :cargo)
  p "Validate for #{train} successful."
  #train = CargoTrain.new("", :cargo)
  #train = CargoTrain.new("", :passenger)
rescue => message
    p message
end

begin
  train = CargoTrain.new("98e-e8", :passenger)
  p "Validate for #{train} successful."  #
rescue => message
    p message
end

begin
  train = CargoTrain.new("98e-e8", :cargo)
  p "Validate for #{train} successful."  #
rescue => message
    p message
end
p "---"

begin
  carriage = CargoCarriage.new("555-hgf55", :cargo, 123.45)
  p "Validate for #{carriage} successful."
  carriage = CargoCarriage.new("555-hgf55", :passenger, 123.45)
rescue => message
    p message
end

#rail_controller.menu
