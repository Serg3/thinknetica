require_relative 'train'
require_relative 'validation'

class PassengerTrain < Train
  validate :type, :type, :passenger
  validate :number, :format, TRAIN_NUMBER_FORMAT

  def right_type?(carriage)
    carriage.class == PassengerCarriage
  end
end
