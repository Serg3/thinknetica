require_relative 'carriage'

class PassengerCarriage < Carriage
  validate :type, :type, :passenger
  
  def load_carriage
    super 1
  end
end
