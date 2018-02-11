require_relative 'manufacturer'
require_relative 'instance_counter'

class Carriage
  include Manufacturer
  include InstanceCounter

  attr_reader :number, :type, :space, :free_space

  def initialize(number, type, space)
    @number = number
    @type = type
    @space = space
    @free_space = space
    validation!
    register_instance
  end

  def valid?
    return false if number.nil? || number.length.zero? || (type != 1 && type != 2)
    true
  end

  def taken_space
    space - free_space
  end

  def load_carriage(volume)
    @free_space -= volume if free_space >= volume
  end

  private

  attr_writer :free_space

  def validation!
    raise ArgumentError.new('!!!Some argument is wrong!!!') unless valid?
  end
end
