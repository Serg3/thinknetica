class Station
  include InstanceCounter

  attr_accessor :name
  attr_reader :trains

  @@stations = []

  def self.all
    @@stations
  end

  def initialize(name)
    @name = name
    validation!
    @trains = []
    @@stations << self
    register_instance
  end

  def arrival(train)
    @trains << train
  end

  def departure(train)
    @trains.delete(train)
  end

  def list_of_trains_by_type(type = nil)
    @trains.select { |train| train.type == type } if type
  end

  def valid?
    return false if name.nil? || name.length.zero?
    true
  end

  def trains
    if block_given?
      trains.each { |train| yield(train) }
    else
      @trains
    end
  end

  private

  def validation!
    raise ArgumentError, '!!!Station name must have at least one character!!!' unless valid?
  end
end
