module Manufacturer
  attr_accessor :company
end

module InstanceCounter
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    attr_accessor :instances
  end

  module InstanceMethods
    #self.class.instances ||= 0

    private

    def register_instance
      self.class.instances ||= 0
      self.class.instances += 1
    end
  end
end
