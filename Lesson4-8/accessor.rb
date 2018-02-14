module Accessor
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    def attr_accessor_with_history(*variables)
      variables.each do |variable|

        variable_name = "@#{variable}".to_sym
        variable_history = "@#{variable}_history".to_sym
        #instance_variable_set(variable_history, Array.new)

        define_method("#{variable}".to_sym) { instance_variable_get(variable_name) }
        define_method("#{variable}=".to_sym) do |value|
          instance_variable_set(variable_name, value)
          #p variable_history.to_s
          #p instance_eval(variable_history.to_s)
          #add_variable_history(value)
        end


        define_method("#{variable}_history".to_sym) { instance_variable_get(variable_history) }
        # class_eval do
        #   def add_variable_history(value)
        #     instance_eval(variable_history.to_s) << value
        #   end
        # end

      end
    end
  end

  module InstanceMethods
  end
end
