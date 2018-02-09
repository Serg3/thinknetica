class Route
  include InstanceCounter

  attr_reader :list_of_stations, :name

  def initialize(first_station, last_station)
    @list_of_stations = []
    @name = first_station.name + " - " + last_station.name
    validation!(first_station)
    validation!(last_station)
    @list_of_stations << first_station << last_station
    register_instance
  end

  def add_station(station)
    validation!(station)
    list_of_stations.insert(-2, station)
  end

  def remove_station(station)
    list_of_stations.delete(station)
  end

  def valid?(station = nil)
    if station.class == Station
      true if station.name.length > 0
    elsif station.nil?
      list_of_stations.each { |station| return false if station.class != Station || station.name.length.zero? }
      true
    else
      false
    end
  end

  private

  def validation!(station)
    raise ArgumentError.new('Route name must have only station objects!') unless valid?(station)
  end
end
