require_relative 'accessor'
require_relative 'validation'

class Station
  include InstanceCounter
  include Accessor
  include Validation

  #attr_accessor :name
  attr_accessor_with_history :name
  strong_attr_accessor :variable, :type

  validate :name, :presence
  validate :name, :type, String

  @@stations = []

  def self.all
    @@stations
  end

  def initialize(name)
    @name = name
    validate!
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

  def trains
    if block_given?
      trains.each { |train| yield(train) }
    else
      @trains
    end
  end
end
