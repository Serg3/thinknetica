module Accessor
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    def attr_accessor_with_history(*variables)
      variables.each do |variable|
        variable_name = "@#{variable}".to_sym
        define_method(variable) { instance_variable_get(variable_name) }
        define_method("#{variable}=".to_sym) do |value|
          instance_variable_set(variable_name, value)
        end
      end
    end
  end

  module InstanceMethods
    def <имя_атрибута>_history
    end
  end
end
