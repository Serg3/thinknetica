class Train
  attr_reader :number, :carriages, :speed, :type, :route

  def initialize(number)
    @number = number
    @carriages = []
    stop
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

  def add_carriage(carriage)
    # чтобы не передать сюда объект класса Train, т. к. у него тоже есть признак type
    @carriages << carriage if @speed == 0 && carriage.is_a?(Carriage) && self.type == carriage.type
  end

  def remove_carriage(carriage)
    if @carriages.size > 0 && carriage.is_a?(Carriage) && self.type == carriage.type
      @carriages.delete(carriage) if @speed == 0
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

  # эти методы не являются интерфейсом класса, так как не являются действиями для объектов, их используют их используют только инстансные методы класса
  private

  def move_train(station_index)
    @station.departure(self)
    @station = @route.list_of_stations[station_index]
    @station.arrival(self)
  end

  def current_station_index
    @route.list_of_stations.index(@station)
  end
end

class PassengerTrain < Train
  def initialize(number)
    super
    @type = :passenger
  end
end

class CargoTrain < Train
  def initialize(number)
    super
    @type = :cargo
  end
end
