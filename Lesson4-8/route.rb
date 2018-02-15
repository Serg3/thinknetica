require_relative 'accessor'
require_relative 'validation'

class Route
  include InstanceCounter
  include Accessor
  include Validation

  attr_reader :stations, :name

  def initialize(first_station, last_station)
    @stations = []
    @name = first_station.name + ' - ' + last_station.name
    @stations << first_station << last_station
    # validation!
    register_instance
  end

  def add_station(station)
    stations.insert(-2, station)
    validation!
  end

  def remove_station(station)
    stations.delete(station)
  end

  # def valid?
  #   stations.each { |station| return false if station.class != Station }
  #   true
  # end

  private

  # def validation!
  #   raise ArgumentError, 'Route name must have only station objects!' unless valid?
  # end
end
