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

  def initialize(number, type, space)
    @number = number
    @type = type
    @space = space
    @free_space = space
    # validation!
    register_instance
  end

  # def valid?
  #   return false if number.nil? || number.length.zero? || (type != :passenger && type != :cargo)
  #   true
  # end

  def taken_space
    (space - free_space).round(2)
  end

  def load_carriage(volume)
    @free_space -= volume if free_space >= volume
  end

  private

  attr_writer :free_space

  # def validation!
  #   raise ArgumentError, '!!!Some argument is wrong!!!' unless valid?
  # end
end
