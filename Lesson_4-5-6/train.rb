require_relative 'manufacturer'
require_relative 'instance_counter'
require_relative 'validations'

class Train
  include Manufacturer
  include InstanceCounter
  include Validation

  attr_reader :number, :carriages, :speed, :route

  @@trains = {}

  def self.find(number)
    @@trains[number]
  end

  def initialize(number)
    @number = number
    @carriages = []
    stop
    @@trains[number] = self
    register_instance
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
    @carriages << carriage if @speed == 0 && right_type?(carriage)
  end

  def remove_carriage(carriage)
    @carriages.delete(carriage) if @speed == 0 if @carriages.size > 0
  end

  def route=(route)
    @route = route
    @station = @route.list_of_stations.first
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