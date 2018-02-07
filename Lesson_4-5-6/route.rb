class Route
  include InstanceCounter

  attr_reader :list_of_stations, :name

  def self.valid?(first_station, last_station)
    return false if first_station.nil? || last_station.nil?
    true
  end

  def initialize(first_station, last_station)
    @list_of_stations = []
    @name = first_station.name + " - " + last_station.name
    @list_of_stations << first_station << last_station
    register_instance
  end

  def add_station(station)
    @list_of_stations.insert(-2, station)
  end

  def remove_station(station)
    @list_of_stations.delete(station)
  end
end
