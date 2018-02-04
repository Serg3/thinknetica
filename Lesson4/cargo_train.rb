require_relative 'train'

class CargoTrain < Train
  def comparsion_of_types(carriage)
    carriage.class == CargoCarriage
  end
end
