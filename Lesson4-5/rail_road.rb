class RailRoad
  attr_reader :stations, :trains, :routes, :carriages

  def initialize
    @stations = []
    @trains = []
    @routes = []
    @carriages = []
  end

  # --- MENU ---

  def menu
    puts '------------------------------'
    puts '1. Station actions.'
    puts '2. Route actions.'
    puts '3. Train actions.'
    puts '4. Carriage actions.'
    puts '5. Enter something else for exit.'
    puts '------------------------------'
    choise = make_choise

    case choise
    when 1
      puts '1. Create station.'
      puts '2. List of trains at station.'
      puts '3. List of stations.'
      puts '4. ALL stations from CLASS-METHOD.'
      choise = make_choise

      case choise
      when 1 then create_station
      when 2 then list_of_trains_at_station
      when 3 then puts_list_of_stations
      when 4 then Station.all.each { |station| puts station.name }
      end

      menu
    when 2
      puts '1. Create route.'
      puts '2. Add station to route.'
      puts '3. Remove station from route.'
      puts '4. List of stations at route.'
      puts '5. List of routes.'
      choise = make_choise

      case choise
      when 1 then create_route
      when 2 then add_station_to_route
      when 3 then remove_station_from_route
      when 4 then list_of_stations_at_route
      when 5 then puts_list_of_routes
      end

      menu
    when 3
      puts '1. Create train.'
      puts '2. Set route to train.'
      puts '3. Move train forward.'
      puts '4. Move train backward.'
      puts '5. List of carriages at train.'
      puts '6. List of trains.'
      choise = make_choise

      case choise
      when 1 then create_train
      when 2 then set_route_to_train
      when 3 then move_train_forward
      when 4 then move_train_backward
      when 5 then puts_list_of_carriages_at_train
      when 6 then puts_list_of_trains
      end

      menu
    when 4
      puts '1. Create carriage.'
      puts '2. Add carriage to train.'
      puts '3. Remove carriage from train.'
      puts '4. List of carriages.'
      choise = make_choise

      case choise
      when 1 then create_carriage
      when 2 then add_carriage_to_train
      when 3 then remove_carriage_from_train
      when 4 then puts_list_of_carriages
      end

      menu
    else
      puts 'Good bye!'
    end
  end

  private

  # --- SUBMETHODS ---

  def make_choise
    print 'Please, make your choise: '
    gets.chomp.to_i
  end

  def puts_list_of_stations
    puts "List of stations:"
    @stations.map.with_index { |station, index| puts "#{index + 1} - #{station.name}" }
  end

  def puts_list_of_routes
    puts "List of routes:"
    @routes.map.with_index { |route, index| puts "#{index + 1} - #{route.name}" }
  end

  def puts_list_of_trains
    puts "List of trains:"
    @trains.map.with_index { |train, index| puts "#{index + 1} - #{train.class} №#{train.number}" }
  end

  def puts_list_of_carriages
    puts "List of carriages:"
    @carriages.map.with_index { |carriage, index| puts "#{index + 1} - #{carriage.class} №#{carriage.number}" }
  end

  # --- MAIN ACTIONS ---

  def create_station
    print 'Enter station name: '
    station_name = gets.chomp
    new_station = Station.new(station_name)
    @stations << new_station
    puts "Station '#{new_station.name}' created."
  end

  def create_train
    puts 'Types: 1 - passenger, 2 - cargo.'
    print 'Select train type: '
    train_type = gets.chomp
    print 'Enter train number: '
    train_number = gets.chomp

    new_train = PassengerTrain.new(train_number) if train_type == 1
    new_train = CargoTrain.new(train_number) if train_type == 2

    unless new_train.nil?
      @trains << new_train
      puts "#{new_train.class} №#{new_train.number} created."
    else
      puts "Train not created."
    end
  end

  def create_route
    puts_list_of_stations
    print "Enter number of starting station: "
    starting_station_index = gets.chomp.to_i
    starting_station = @stations[starting_station_index - 1]
    print "Enter number of last station: "
    last_station_index = gets.chomp.to_i
    last_station = @stations[last_station_index - 1]

    unless starting_station.nil? && last_station.nil?
      new_route = Route.new(starting_station, last_station)
      @routes << new_route
      puts "Route '#{new_route.name}' created."
    end
  end

  def create_carriage
    puts 'Types: 1 - passenger, 2 - cargo.'
    print 'Select carriage type: '
    carriage_type = gets.chomp.to_i
    print 'Enter carriage number: '
    carriage_number = gets.chomp

    new_carriage = PassengerCarriage.new(carriage_number) if carriage_type == 1
    new_carriage = CargoCarriage.new(carriage_number) if carriage_type == 2

    unless new_carriage.nil?
      @carriages << new_carriage
      puts "#{new_carriage.class} №#{new_carriage.number} created."
    else
      puts "Carriage not created."
    end
  end

  def add_station_to_route
    puts_list_of_routes
    print "Enter route index: "
    change_route_index = gets.chomp.to_i
    change_route = @routes[change_route_index - 1]

    puts_list_of_stations
    print "Enter station index: "
    add_station_index = gets.chomp.to_i
    add_station = @stations[add_station_index - 1]

    change_route.add_station(add_station) unless add_station.nil? && change_route.nil?
  end

  def remove_station_from_route
    puts_list_of_routes
    print "Enter route index: "
    change_route_index = gets.chomp.to_i
    change_route = @routes[change_route_index - 1]

    puts "List of stations at route:"
    change_route.list_of_stations.map.with_index { |station, index| puts "#{index + 1} - #{station.name}" }
    print "Enter station index: "
    remove_station_index = gets.chomp.to_i
    remove_station = change_route.list_of_stations[remove_station_index - 1]

    change_route.remove_station(remove_station) unless remove_station.nil? && change_route.nil?
  end

  def set_route_to_train
    puts_list_of_trains
    print "Enter train index: "
    change_train_index = gets.chomp.to_i
    change_train = @trains[change_train_index - 1]

    puts_list_of_routes
    print "Enter route index: "
    set_route_index = gets.chomp.to_i
    set_route = @routes[set_route_index - 1]

    change_train.route = set_route unless change_train.nil? && set_route.nil?
  end

  def add_carriage_to_train
    puts_list_of_carriages
    print "Enter carriage index: "
    add_carriage_index = gets.chomp.to_i
    add_carriage = @carriages[add_carriage_index - 1]

    puts_list_of_trains
    print "Enter train index: "
    change_train_index = gets.chomp.to_i
    change_train = @trains[change_train_index - 1]

    change_train.add_carriage(add_carriage) unless change_train.nil? || add_carriage.nil?
  end

  def remove_carriage_from_train
    puts_list_of_trains
    print "Enter train index: "
    change_train_index = gets.chomp.to_i
    change_train = @trains[change_train_index - 1]

    puts "List of carriages at train:"
    change_train.carriages.map.with_index { |carriage, index| puts "#{index + 1} - #{carriage.number}" }
    print "Enter carriage index: "
    remove_carriage_index = gets.chomp.to_i
    remove_carriage = change_train.carriages[remove_carriage_index - 1]

    change_train.remove_carriage(remove_carriage) unless change_train.nil? || remove_carriage.nil?
  end

  def puts_list_of_carriages_at_train
    puts_list_of_trains
    print "Enter train index: "
    change_train_index = gets.chomp.to_i
    change_train = @trains[change_train_index - 1]

    change_train.carriages.map.with_index { |carriage, index| puts "#{index + 1} - №#{carriage.number}" } unless change_train.nil?
  end

  def move_train_forward
    puts_list_of_trains
    print "Enter train index: "
    change_train_index = gets.chomp.to_i
    change_train = @trains[change_train_index - 1]

    change_train.move_forward unless change_train.nil?
  end

  def move_train_backward
    puts_list_of_trains
    print "Enter train index: "
    change_train_index = gets.chomp.to_i
    change_train = @trains[change_train_index - 1]

    change_train.move_backward unless change_train.nil?
  end

  def list_of_stations_at_route
    puts_list_of_routes
    print "Enter route index: "
    change_route_index = gets.chomp.to_i
    change_route = @routes[change_route_index - 1]

    change_route.list_of_stations.map.with_index { |station, index| puts "#{index + 1} - #{station.name}" } unless change_route.nil?
  end

  def list_of_trains_at_station
    puts_list_of_stations
    print "Enter station index: "
    station_index = gets.chomp.to_i
    station = @stations[station_index - 1]

    station.list_of_trains.map.with_index { |train, index| puts "#{index + 1} - #{train.class} №#{train.number}" } unless station.nil?
  end
end
