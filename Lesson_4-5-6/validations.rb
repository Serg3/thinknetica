module Validation
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    def type_validation!(number, type)
      if type == 1
        PassengerTrain.new(number)
      elsif type == 2
        CargoTrain.new(number)
      else
        raise ArgumentError.new("You must to choose Passenger or Cargo type!")
      end
    end
  end

  module InstanceMethods
    private

    def validation!(number)
      if number.nil? || number.size.zero?
        raise ArgumentError.new('Train number must have at least one character!')
      end
    end
  end
end
