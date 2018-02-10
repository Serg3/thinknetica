require_relative 'carriage'

class PassengerCarriage < Carriage
  def add_passenger_to_carriage
    @free_space -= 1 if (free_space - 1) >= 0
  end
end
