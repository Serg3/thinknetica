require_relative 'train'

class CargoTrain < Train
  def right_type?(carriage)
    carriage.class == CargoCarriage
  end
end
