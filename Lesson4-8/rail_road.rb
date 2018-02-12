class RailRoad
  attr_reader :stations, :trains, :routes, :carriages

  def initialize
    @stations = []
    @trains = []
    @routes = []
    @carriages = []
  end

  # --- MENU ---

  def main_menu
    p '------------------------------'
    p '1. Station actions.'
    p '2. Route actions.'
    p '3. Train actions.'
    p '4. Carriage actions.'
    p '5. MODULE 8 METHODS.'
    p 'Enter something else for exit.'
    p '------------------------------'
    make_choise
  end

  def station_submenu
    p '1. Create station.'
    p '2. List of trains at station.'
    p '3. List of stations.'
    p '4. ALL stations from CLASS-METHOD.'
    case make_choise
    when 1 then create_station
    when 2 then station_trains
    when 3 then puts_stations
    when 4 then Station.all.each { |station| puts station.name }
    end
    menu
  end

  def route_submenu
    p '1. Create route.'
    p '2. Add station to route.'
    p '3. Remove station from route.'
    p '4. List of stations at route.'
    p '5. List of routes.'
    case make_choise
    when 1 then create_route
    when 2 then add_route_station
    when 3 then remove_route_station
    when 4 then route_stations
    when 5 then puts_routes
    end
    menu
  end

  def train_submenu
    p '1. Create train.'
    p '2. Set route to train.'
    p '3. Move train forward.'
    p '4. Move train backward.'
    p '5. List of carriages at train.'
    p '6. List of trains.'
    case make_choise
    when 1 then create_train
    when 2 then set_route_to_train
    when 3 then move_train_forward
    when 4 then move_train_backward
    when 5 then puts_train_carriages
    when 6 then puts_trains
    end
    menu
  end

  def carriage_submenu
    p '1. Create carriage.'
    p '2. Add carriage to train.'
    p '3. Remove carriage from train.'
    p '4. List of carriages.'
    case make_choise
    when 1 then create_carriage
    when 2 then add_train_carriage
    when 3 then remove_train_carriage
    when 4 then puts_carriages
    end
    menu
  end

  def module_8_submenu
    p '1. Take space in carriage.'
    p '2. Free space in carriage.'
    p '3. Taken space in carriage.'
    p '4. Trains at station via block.'
    p '5. Carriages at train via block.'
    p '6. ALL stations with trains and their carriages.'
    case make_choise
    when 1 then take_carriage_space
    when 2 then free_carriage_space
    when 3 then taken_carriage_space
    when 4 then station_trains_block
    when 5 then train_carriages_block
    when 6 then stations_trains_carriages
    end
    menu
  end

  def menu
    case main_menu
    when 1 then station_submenu
    when 2 then route_submenu
    when 3 then train_submenu
    when 4 then carriage_submenu
    when 5 then module_8_submenu
    else p 'Good bye!'
    end
  end

  private

  # --- SUBMETHODS ---

  def make_choise
    print 'Please, make your choise: '
    gets.chomp.to_i
  end

  def puts_stations
    p 'List of stations:'
    @stations.map.with_index do |station, index|
      p "#{index + 1} - #{station.name}"
    end
  end

  def puts_routes
    p 'List of routes:'
    @routes.map.with_index do |route, index|
      p "#{index + 1} - #{route.name}"
    end
  end

  def puts_trains
    p 'List of trains:'
    @trains.map.with_index do |train, index|
      p "#{index + 1} - #{train.class} №#{train.number}"
    end
  end

  def puts_carriages
    p 'List of carriages:'
    @carriages.map.with_index do |carriage, index|
      p "#{index + 1} - #{carriage.class} №#{carriage.number}"
    end
  end

  def choose_route
    puts_routes
    print 'Enter route index: '
    route_index = gets.chomp.to_i
    @routes[route_index - 1] if route_index > 0
  end

  def choose_station
    puts_stations
    print 'Enter station index: '
    station_index = gets.chomp.to_i
    @stations[station_index - 1] if station_index > 0
  end

  def choose_train
    puts_trains
    print 'Enter train index: '
    train_index = gets.chomp.to_i
    @trains[train_index - 1] if train_index > 0
  end

  def choose_carriage
    puts_carriages
    print 'Enter carriage index: '
    carriage_index = gets.chomp.to_i
    @carriages[carriage_index - 1] if carriage_index > 0
  end

  def puts_carriage_format(train)
    train.carriages do |carriage|
      format_str = ""
      format_str << "    #{carriage.class} №#{carriage.number}: "
      p format_str << "free: #{carriage.free_space}, taken: #{carriage.taken_space}"
    end
  end

  def set_type(type)
    if type == 1
      :passenger
    elsif type == 2
      :cargo
    end
  end

  def compare_train_type(number, type)
    if type == :passenger
      PassengerTrain.new(number, type)
    elsif type == :cargo
      CargoTrain.new(number, type)
    end
  end

  def compare_carriage_type(number, type, space)
    if type == :passenger
      PassengerCarriage.new(number, type, space.to_i)
    elsif type == :cargo
      CargoCarriage.new(number, type, space.to_f)
    end
  end

  # --- MAIN ACTIONS ---

  def create_station
    attempt = 0
    begin
      print 'Enter station name: '
      @stations << Station.new(gets.chomp.strip)
      p "Station '#{@stations.last.name}' created."
    rescue StandardError
      attempt += 1
      p 'You must enter some name!'
      retry if attempt < 3
    end
  end

  def create_route
    attempt = 0
    begin
      puts_stations
      print 'Enter number of starting station: '
      starting_station_index = gets.chomp.to_i
      starting_station = @stations[starting_station_index - 1] if starting_station_index > 0
      print 'Enter number of last station: '
      last_station_index = gets.chomp.to_i
      last_station = @stations[last_station_index - 1] if last_station_index > 0

      @routes << Route.new(starting_station, last_station)
      p "Route '#{@routes.last.name}' created."
    rescue StandardError
      attempt += 1
      p 'You must to choose stations from list!'
      retry if attempt < 3
    end
  end

  def create_train
    attempt = 0
    begin
      p 'Types: 1 - passenger, 2 - cargo.'
      print 'Select train type: '
      train_type = gets.chomp.to_i
      train_type = set_type(train_type)
      print 'Enter train number: '
      train_number = gets.chomp.strip

      @trains << compare_train_type(train_number, train_type)
      if train_type != :passenger && train_type != :cargo
        raise ArgumentError, '!!!Type argument is wrong!!!'
      end
      p "#{@trains.last.class} №#{@trains.last.number} created."
    rescue StandardError
      attempt += 1
      p 'You must enter right arguments!'
      retry if attempt < 3
    end
  end

  def create_carriage
    attempt = 0
    begin
      p 'Types: 1 - passenger, 2 - cargo.'
      print 'Select carriage type: '
      carriage_type = gets.chomp.to_i
      carriage_type = set_type(carriage_type)
      print 'Enter carriage number: '
      carriage_number = gets.chomp.strip
      print 'Enter carriage space: '
      carriage_space = gets.chomp

      @carriages << compare_carriage_type(carriage_number, carriage_type, carriage_space)
      p "#{@carriages.last.class} №#{@carriages.last.number} created."
    rescue StandardError
      attempt += 1
      p 'You must enter right arguments!'
      retry if attempt < 3
    end
  end

  def add_route_station
    attempt = 0
    begin
      route = choose_route
      station = choose_station
      route.add_station(station) if route.clone.add_station(station)
    rescue StandardError
      attempt += 1
      p 'You must to choose station from list!'
      retry if attempt < 3
    end
  end

  def remove_route_station
    route = choose_route
    p 'List of stations at route:'
    route.stations.map.with_index { |station, index| p "#{index + 1} - #{station.name}" }
    print 'Enter station index: '
    station_index = gets.chomp.to_i
    station = route.stations[station_index - 1] if station_index > 0

    route.remove_station(station) if station && route
  end

  def set_route_to_train
    train = choose_train
    route = choose_route
    train.route = route if train && route
  end

  def add_train_carriage
    carriage = choose_carriage
    train = choose_train
    train.add_carriage(carriage) if train && carriage
  end

  def remove_train_carriage
    train = choose_train
    p 'List of carriages at train:'
    train.carriages.map.with_index { |carriage, index| p "#{index + 1} - #{carriage.number}" }
    print 'Enter carriage index: '
    carriage_index = gets.chomp.to_i
    carriage = train.carriages[carriage_index - 1] if carriage_index > 0

    train.remove_carriage(carriage) if train && carriage
  end

  def puts_train_carriages
    train = choose_train
    if train
      train.carriages.map.with_index do |carriage, index|
        p "#{index + 1} - №#{carriage.number}"
      end
    end
  end

  def move_train_forward
    train = choose_train
    train.move_forward if train
  end

  def move_train_backward
    train = choose_train
    train.move_backward if train
  end

  def route_stations
    route = choose_route
    if route
      route.stations.map.with_index do |station, index|
        p "#{index + 1} - #{station.name}"
      end
    end
  end

  def station_trains
    station = choose_station
    if station
      station.trains.map.with_index do |train, index|
        p "#{index + 1} - #{train.class} №#{train.number}"
      end
    end
  end

  # MODULE 8 METHODS

  def take_carriage_space
    carriage = choose_carriage
    if carriage.class == PassengerCarriage
      carriage.load_carriage
    elsif carriage.class == CargoCarriage
      print 'Enter taken volume: '
      volume = gets.chomp.to_f
      carriage.load_carriage(volume) unless volume < 0
    end
  end

  def free_carriage_space
    carriage = choose_carriage
    p "Free space: #{carriage.free_space}"
  end

  def taken_carriage_space
    carriage = choose_carriage
    p "Taken space: #{carriage.taken_space}"
  end

  def station_trains_block
    station = choose_station
    station.trains { |train| p "#{train.class} №#{train.number}" }
  end

  def train_carriages_block
    train = choose_train
    puts_carriage_format(train)
  end

  def stations_trains_carriages
    @stations.each do |station|
      p "#{station.name} -----------------------"
      station.trains do |train|
        p "  #{train.class} №#{train.number} with #{train.carriages.size} carriages:"
        puts_carriage_format(train)
      end
    end
  end
end
