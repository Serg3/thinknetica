require_relative 'manufacturer'
require_relative 'instance_counter'

class Carriage
  include Manufacturer
  include InstanceCounter

  attr_reader :number, :type

  def initialize(number, type)
    @number = number
    @type = type
    validation!
    register_instance
  end

  def valid?
    return false if number.nil? || number.length.zero? || (type != 1 && type != 2)
    true
  end

  private

  def validation!
    raise ArgumentError.new('!!!Some argument is wrong!!!') unless valid?
  end
end
