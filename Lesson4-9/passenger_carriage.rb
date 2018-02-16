require_relative 'carriage'

class PassengerCarriage < Carriage
  strong_attr_accessor :train, PassengerTrain

  validate :type, :type, :passenger

  def load_carriage
    super 1
  end
end
