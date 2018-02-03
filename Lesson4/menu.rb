class Menu
  def initialize
    @actions = Actions.new
  end

  def menu
    puts '------------------------------'
    puts '1. Station actions.'
    puts '2. Route actions.'
    puts '3. Train actions.'
    puts '4. Carriage actions.'
    puts '5. Enter something else for exit.'
    puts '------------------------------'
    choise = @actions.make_choise

    case choise
    when 1
      puts '1. Create station.'
      puts '2. List of trains at station.'
      puts '3. List of stations.'
      choise = @actions.make_choise

      case choise
      when 1 then @actions.create_station
      when 2 then @actions.list_of_trains_at_station
      when 3 then @actions.puts_list_of_stations
      end

      self.menu
    when 2
      puts '1. Create route.'
      puts '2. Add station to route.'
      puts '3. Remove station from route.'
      puts '4. List of stations at route.'
      puts '5. List of routes.'
      choise = @actions.make_choise

      case choise
      when 1 then @actions.create_route
      when 2 then @actions.add_station_to_route
      when 3 then @actions.remove_station_from_route
      when 4 then @actions.list_of_stations_at_route
      when 5 then @actions.puts_list_of_routes
      end

      self.menu
    when 3
      puts '1. Create train.'
      puts '2. Set route to train.'
      puts '3. Move train forward.'
      puts '4. Move train backward.'
      puts '5. List of carriages at train.'
      puts '6. List of trains.'
      choise = @actions.make_choise

      case choise
      when 1 then @actions.create_train
      when 2 then @actions.set_route_to_train
      when 3 then @actions.move_train_forward
      when 4 then @actions.move_train_backward
      when 5 then @actions.puts_list_of_carriages_at_train
      when 6 then @actions.puts_list_of_trains
      end

      self.menu
    when 4
      puts '1. Create carriage.'
      puts '2. Add carriage to train.'
      puts '3. Remove carriage from train.'
      puts '4. List of carriages.'
      choise = @actions.make_choise

      case choise
      when 1 then @actions.create_carriage
      when 2 then @actions.add_carriage_to_train
      when 3 then @actions.remove_carriage_from_train
      when 4 then @actions.puts_list_of_carriages
      end

      self.menu
    else
      puts 'Good bye!'
    end
  end
end
