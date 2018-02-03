require_relative 'train'

class CargoTrain < Train
  def add_carriage(carriage)
    if @speed == 0 && carriage.class == CargoCarriage
      @carriages << carriage
      puts "Carriage added to train."
    else
      puts "Carriage not added to train!"
    end
  end
end
