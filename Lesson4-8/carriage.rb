require_relative 'manufacturer'
require_relative 'instance_counter'
require_relative 'accessor'
require_relative 'validation'

class Carriage
  include Manufacturer
  include InstanceCounter
  include Accessor
  include Validation

  attr_reader :number, :type, :space, :free_space

  validate :number, :presence

  def initialize(number, type, space)
    @number = number
    @type = type
    @space = space
    @free_space = space
    validate!
    register_instance
  end

  def taken_space
    (space - free_space).round(2)
  end

  def load_carriage(volume)
    @free_space -= volume if free_space >= volume
  end

  private

  attr_writer :free_space
end
