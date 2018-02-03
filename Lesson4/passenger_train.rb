require_relative 'train'

class PassengerTrain < Train
  def add_carriage(carriage)
    if @speed == 0 && carriage.class == PassengerCarriage
      @carriages << carriage
      puts "Carriage added to train."
    else
      puts "Carriage not added to train!"
    end
  end
end
