module Vattributes
  module Extension
    extend ActiveSupport::Concern

    included do
      serialize :vattributes, JSON
    end

    def vattribute_get(name)
      self.virtual_attributes[name.to_s]
    end

    def vattribute_set(name, value)
      self.vattributes = self.virtual_attributes.merge({ name.to_s => value })
    end

    def virtual_attributes
      read_attribute(:vattributes) || {}
    end

    module ClassMethods
      def vattributes(*names)
        names.each do |name|

          # setter
          define_method "#{name}=" do |value|
            vattribute_set(name, value)
          end

          # getter
          define_method "#{name}" do
            vattribute_get(name)
          end

        end
      end
    end

  end
end

if defined?(ActiveRecord)
  ActiveRecord::Base.send(:include, Vattributes::Extension)
end
