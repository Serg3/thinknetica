require_relative 'manufacturer'
require_relative 'instance_counter'
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

3.times { |x| rail_controller.stations << Station.new("Station_#{x}") }

rail_controller.trains << PassengerTrain.new("555-55", 1)
rail_controller.trains << PassengerTrain.new("55555", 1)
rail_controller.trains << CargoTrain.new("333-33", 2)
rail_controller.trains << CargoTrain.new("33333", 2)

rail_controller.stations[0].arrival(rail_controller.trains[0])
rail_controller.stations[0].arrival(rail_controller.trains[2])
rail_controller.stations[1].arrival(rail_controller.trains[1])
rail_controller.stations[2].arrival(rail_controller.trains[3])

rail_controller.carriages << PassengerCarriage.new("132", 1, 67)
rail_controller.carriages << PassengerCarriage.new("134", 1, 65)
rail_controller.carriages << PassengerCarriage.new("987", 1, 65)
rail_controller.carriages << PassengerCarriage.new("456", 1, 67)
rail_controller.carriages << PassengerCarriage.new("742", 1, 67)
rail_controller.carriages << CargoCarriage.new("57", 2, 158.6)
rail_controller.carriages << CargoCarriage.new("29", 2, 158.6)
rail_controller.carriages << CargoCarriage.new("41", 2, 126.4)
rail_controller.carriages << CargoCarriage.new("83", 2, 126.4)
rail_controller.carriages << CargoCarriage.new("68", 2, 158.6)

rail_controller.trains[0].add_carriage(rail_controller.carriages[0])
rail_controller.trains[0].add_carriage(rail_controller.carriages[1])
rail_controller.trains[1].add_carriage(rail_controller.carriages[2])
rail_controller.trains[1].add_carriage(rail_controller.carriages[3])
rail_controller.trains[1].add_carriage(rail_controller.carriages[4])
rail_controller.trains[2].add_carriage(rail_controller.carriages[5])
rail_controller.trains[2].add_carriage(rail_controller.carriages[6])
rail_controller.trains[2].add_carriage(rail_controller.carriages[7])
rail_controller.trains[2].add_carriage(rail_controller.carriages[8])
rail_controller.trains[3].add_carriage(rail_controller.carriages[9])

rail_controller.carriages[0].add_passenger_to_carriage
2.times { rail_controller.carriages[2].add_passenger_to_carriage }
3.times { rail_controller.carriages[3].add_passenger_to_carriage }
rail_controller.carriages[5].load_carriage(58.6)
rail_controller.carriages[8].load_carriage(100)
rail_controller.carriages[9].load_carriage(58.6)
rail_controller.carriages[9].load_carriage(50)

rail_controller.all_stations_with_trains_carriages

rail_controller.menu
