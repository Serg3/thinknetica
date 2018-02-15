require_relative 'accessor'
require_relative 'validation'

class Route
  include InstanceCounter
  include Accessor
  include Validation

  attr_reader :stations, :name, :first_station, :last_station

  validate :first_station, :type, Station
  validate :last_station, :type, Station

  def initialize(first_station, last_station)
    @stations = []
    @first_station = first_station
    @last_station = last_station
    @name = first_station.name + ' - ' + last_station.name
    @stations << first_station << last_station
    validate!
    register_instance
  end

  def add_station(station)
    stations.insert(-2, station)
    #validation!
  end

  def remove_station(station)
    stations.delete(station)
  end
end
