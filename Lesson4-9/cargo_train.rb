require_relative 'train'
require_relative 'validation'

class CargoTrain < Train
  validate :type, :type, :cargo
  validate :number, :format, TRAIN_NUMBER_FORMAT

  def right_type?(carriage)
    carriage.class == CargoCarriage
  end
end
