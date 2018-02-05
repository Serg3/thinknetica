require_relative 'instance_counter'

class Carriage
  include Manufacturer
  include InstanceCounter

  attr_reader :number

  def initialize(number)
    @number = number
    register_instance
  end
end
