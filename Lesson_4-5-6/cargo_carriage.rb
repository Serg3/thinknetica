require_relative 'carriage'

class CargoCarriage < Carriage
  def space
    @space.round(2)
  end

  def free_space
    @free_space.round(2)
  end
end
