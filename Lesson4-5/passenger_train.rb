require_relative 'train'

class PassengerTrain < Train
  def comparsion_of_types(carriage)
    carriage.class == PassengerCarriage
  end
end
