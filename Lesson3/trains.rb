class Station
  attr_accessor :name

  def initialize(name)
    @name = name
    @list_of_trains = []
  end

  def input_train(train)
    @list_of_trains << train
  end

  def output_train(train)
    @list_of_trains.delete(train)
  end

  def list_of_trains(type = nil)
    type == nil ? @list_of_trains : @list_of_trains.select { |train| train.type == type }
  end
end

class Route
  attr_accessor :name
  attr_reader :list_of_stations

  def initialize(name, first_station, last_station)
    @list_of_stations = []
    @name = name
    @first_station = first_station
    @last_station = last_station
    @list_of_stations << first_station << last_station
  end

  def add_station(station)
    @list_of_stations.insert(-2, station)
  end

  def remove_station(station)
    @list_of_stations.delete(station)
  end
end

class Train
  attr_reader :number, :carriages, :speed, :type, :route

  def initialize(number, type, carriages)
    @number = number
    @type = type
    @carriages = carriages
    @speed = 0
  end

  def speed=(speed)
    @speed = speed if speed > 0
  end

  def stop(speed)
    @speed = 0
  end

  def add_carriage
    @carriages += 1 if @speed == 0
  end

  def remove_carriage
    if @carriages > 0
      (@carriages -= 1 if @speed == 0)
    else
      (puts "There are no more carriages!")
    end
  end

  def route=(route)
    if route.is_a? Route
      @route = route
      @station = Station.new(@route.list_of_stations.first)
      @current_station_index = 0
      @station.input_train(self)
    end
  end

  def list_of_stations
    @list_of_stations = @route.list_of_stations
  end

  def forward
    @station.output_train(self)
    list_of_stations
    @current_station_index += 1
    if @current_station_index == @list_of_stations.size
      puts "Final station."
      @current_station_index -= 1
    else
      next_station = @list_of_stations[@current_station_index]
      @station = Station.new(next_station)
      @station.input_train(self)
    end
  end

  def backward
    @station.output_train(self)
    list_of_stations
    @current_station_index -= 1
    if @current_station_index == -1
      puts "Final station."
      @current_station_index += 1
    else
      next_station = @list_of_stations[@current_station_index]
      @station = Station.new(next_station)
      @station.input_train(self)
    end
  end

  def location
    list_of_stations
    current_station_index = @list_of_stations.index(@station)

    puts "Backward station: #{@list_of_stations[current_station_index - 1]}" if current_station_index - 1 != -1
    puts "Current station: #{@station}"
    puts "Forward station: #{@list_of_stations[current_station_index + 1]}" if current_station_index + 1 != list_of_stations.size
  end
end
