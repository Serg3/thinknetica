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

p "Train count: #{PassengerTrain.instances}"
train = PassengerTrain.new('555-gg', 1)
p "Train count: #{PassengerTrain.instances}"
p "Train company: #{train.company}"
train.company = "Train company"
p "Train company: #{train.company}"

p "-----"

p PassengerTrain.find('555')

p "-----"

p "Carriage count: #{CargoCarriage.instances}"
carriage = CargoCarriage.new('555', 2)
p "Carriage count: #{CargoCarriage.instances}"
p "Carriage company: #{carriage.company}"
carriage.company = "Carriage company"
p "Carriage company: #{carriage.company}"

p "-----"

p "Station count: #{Station.instances}"
station_1 = Station.new("station_1")
station_2 = Station.new("station_2")
p "Station count: #{Station.instances}"

p "-----"

Station.all.each { |station| puts station }

p "-----"

p "Route count: #{Route.instances}"
Route.new(station_1, station_2)
p "Route count: #{Route.instances}"

rail_controller = RailRoad.new
rail_controller.menu
