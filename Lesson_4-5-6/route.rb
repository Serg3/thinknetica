class Route
  include InstanceCounter

  attr_reader :list_of_stations, :name

  def initialize(first_station, last_station)
    @list_of_stations = []
    @name = first_station.name + " - " + last_station.name
    validation!(first_station, last_station)
    @list_of_stations << first_station << last_station
    register_instance
  end

  def add_station(station)
    @list_of_stations.insert(-2, station)
  end

  def remove_station(station)
    @list_of_stations.delete(station)
  end

  def valid?(first_station, last_station)
    return false if first_station.nil? || last_station.nil? || first_station.class != Station || last_station.class != Station
    true
  end

  private

  def validation!(first_station, last_station)
    raise ArgumentError.new('Route name must have at least two stations!') unless valid?(first_station, last_station)
  end
end
