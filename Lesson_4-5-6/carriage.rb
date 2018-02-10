require_relative 'manufacturer'
require_relative 'instance_counter'

class Carriage
  include Manufacturer
  include InstanceCounter

  attr_accessor :free_space
  attr_reader :number, :type, :space

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

  private

  def validation!
    raise ArgumentError.new('!!!Some argument is wrong!!!') unless valid?
  end
end
