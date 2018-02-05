require_relative 'train'

class PassengerTrain < Train
  def right_type?(carriage)
    carriage.class == PassengerCarriage
  end
end
