require_relative 'manufacturer'
require_relative 'instance_counter'
require_relative 'accessor'
require_relative 'validation'

class Train
  include Manufacturer
  include InstanceCounter
  include Accessor
  include Validation

  TRAIN_NUMBER_FORMAT = /^[\w&&[^_]]{3}-*{1}\w{2}$/

  attr_reader :number, :type, :speed, :route

  attr_accessor_with_history :variables
  strong_attr_accessor :variable, :type

  @@trains = {}

  def self.find(number)
    @@trains[number]
  end

  def initialize(number, type)
    @number = number
    @type = type
    validate!
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
    @carriages << carriage if @speed.zero? && right_type?(carriage)
  end

  def remove_carriage(carriage)
    @carriages.delete(carriage) if @carriages.any? && @speed.zero?
  end

  def route=(route)
    @route = route
    @station = @route.stations.first
    @station.arrival(self)
  end

  def move_forward
    next_station_index = current_station_index + 1
    move_train(next_station_index) if next_station_index < @route.stations.size
  end

  def move_backward
    next_station_index = current_station_index - 1
    move_train(next_station_index) if next_station_index > -1
  end

  def backward_station
    next_station_index = current_station_index - 1
    @route.stations[next_station_index] if next_station_index > -1
  end

  def current_station
    @station
  end

  def forward_station
    next_station_index = current_station_index + 1
    @route.stations[next_station_index] if next_station_index < @route.stations.size
  end

  def carriages
    if block_given?
      carriages.each { |carriage| yield(carriage) }
    else
      @carriages
    end
  end

  private

  def move_train(station_index)
    @station.departure(self)
    @station = @route.stations[station_index]
    @station.arrival(self)
  end

  def current_station_index
    @route.stations.index(@station)
  end
end
