module Validation
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    def validate(_name, type, arg = nil)
      if type == :presence && arg.nil?

      elsif type == :format # && arg.is_a? Regexp

      elsif type == :type # && arg.is_a? Station

      end
    end
  end

  module InstanceMethods
    def _validate!; end
  end
end
