require_relative 'carriage'

class CargoCarriage < Carriage
  strong_attr_accessor :train, CargoTrain

  validate :type, :type, :cargo

  def space
    @space.round(2)
  end

  def free_space
    @free_space.round(2)
  end
end
