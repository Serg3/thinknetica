class PassengerTrain < Train
  def initialize(number)
    super
  end

  def add_carriage(carriage)
    if @speed == 0 && carriage.class == PassengerCarriage
      @carriages << carriage
      puts "Carriage added to train."
    else
      puts "Carriage not added to train!"
    end
  end
end
