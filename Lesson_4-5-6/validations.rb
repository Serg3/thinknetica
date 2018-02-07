module Validation
  def self.included(base)
    base.extend ClassMethods
    #base.send :include, InstanceMethods
  end

  TRAIN_NUMBER_FORMAT = /[\w&&[^_]]{3}-*\w{2}/

  module ClassMethods
    def valid?(number, type)
      if number.nil? || number.length.zero? || (type != 1 && type != 2)
        false
      else
        if self.inspect == 'Train'
          return false if number !~ TRAIN_NUMBER_FORMAT
        end
        true
      end
    end
  end
end
