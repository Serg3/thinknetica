class Carriage
  attr_reader :number, :type

  def initialize(number)
    @number = number
  end
end

class PassengerCarriage < Carriage
  def initialize(number)
    super
    @type = :passenger
  end
end

class CargoCarriage < Carriage
  def initialize(number)
    super
    @type = :cargo
  end
end
