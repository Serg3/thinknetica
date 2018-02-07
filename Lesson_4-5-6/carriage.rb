require_relative 'manufacturer'
require_relative 'instance_counter'
require_relative 'validations'

class Carriage
  include Manufacturer
  include InstanceCounter
  include Validation

  attr_reader :number

  def initialize(number)
    @number = number
    register_instance
  end
end
