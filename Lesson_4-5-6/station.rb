class Station
  include InstanceCounter

  attr_accessor :name
  attr_reader :list_of_trains

  @@stations = []

  def self.all
    @@stations
  end

  def initialize(name)
    validation! name
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

  private

  def validation!(name)
    if name.nil? || name.length.zero?
      raise ArgumentError.new('Station name must have at least one character!')
    end
  end
end
