class Station
  attr_accessor :name

  def initialize(name)
    @name = name
    @list_of_trains = []
  end

  def arrival(train)
    @list_of_trains << train
  end

  def departure(train)
    @list_of_trains.delete(train)
  end

  def list_of_trains_by_type(type = nil)
    type == nil ? @list_of_trains : @list_of_trains.select { |train| train.type == type }
  end
end

class Route
  attr_reader :list_of_stations, :name

  def initialize(first_station, last_station)
    @list_of_stations = []
    @name = first_station.to_s + " - " + last_station.to_s
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

  def increase_speed(speed)
    @speed += speed
  end

  def decrease_speed(speed)
    if @speed - speed > 0
      @speed -= speed
    else
      @speed = 0
    end
  end

  def stop
    @speed = 0
  end

  def add_carriage
    @carriages += 1 if @speed == 0
  end

  def remove_carriage
    if @carriages > 0
      @carriages -= 1 if @speed == 0
    else
      puts "There are no more carriages!"
    end
  end

  def route=(route)
    if route.is_a? Route
      @route = route
      @station = @route.list_of_stations.first
      @station.arrival(self)
    end
  end

  def current_station_index
    @route.list_of_stations.index(@station)
  end

  def move_train(station_index)
    @station.departure(self)
    @station = @route.list_of_stations[station_index]
    @station.arrival(self)
  end

  def move_forward
    forward_station_index = current_station_index + 1
    move_train(forward_station_index) if forward_station_index < @route.list_of_stations.size
  end

  def move_backward
    backward_station_index = current_station_index - 1
    move_train(backward_station_index) if backward_station_index > -1
  end

  def backward_station
    backward_station_index = current_station_index - 1
    @route.list_of_stations[backward_station_index] if backward_station_index > -1
  end

  def current_station
    @station
  end

  def forward_station
    forward_station_index = current_station_index + 1
    @route.list_of_stations[forward_station_index] if forward_station_index < @route.list_of_stations.size
  end
end
