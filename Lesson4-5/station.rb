class Station
  include InstanceCounter

  attr_accessor :name
  attr_reader :list_of_trains

  @@stations = []

  def initialize(name)
    @name = name
    @list_of_trains = []
    @@stations << self
    register_instance
  end

  def arrival(train)
    @list_of_trains << train
  end

  def departure(train)
    @list_of_trains.delete(train)
  end

  def list_of_trains_by_type(type = nil)
    @list_of_trains.select { |train| train.type == type } unless type.nil?
  end

  def self.all
    @@stations
  end
end
