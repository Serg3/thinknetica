require_relative 'carriage'

class CargoCarriage < Carriage
  def space
    @space.round(2)
  end

  def free_space
    @free_space.round(2)
  end

  def load_carriage(volume)
    @free_space -= volume unless free_space - volume < 0
  end
end
