class Route
  include InstanceCounter

  attr_reader :list_of_stations, :name

  def initialize(first_station, last_station)
    @list_of_stations = []
    @name = first_station.name + " - " + last_station.name
    @list_of_stations << first_station << last_station
    validation!
    register_instance
  end

  def add_station(station)
    list_of_stations.insert(-2, station)
    validation!
  end

  def remove_station(station)
    list_of_stations.delete(station)
  end

  def valid?
    list_of_stations.each { |station| return false if station.class != Station }
    true
  end

  private

  def validation!
    raise ArgumentError.new('Route name must have only station objects!') unless valid?
  end
end
