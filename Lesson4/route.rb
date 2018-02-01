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
