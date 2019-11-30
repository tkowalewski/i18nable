require 'i18n'
require 'i18nable/version'
require 'i18nable/key_builder'

module I18nable
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module InstanceMethods
    def translate(key, options = {})
      self.class.translate(key, options)
    end

    def localize(*args)
      self.class.localize(*args)
    end
  end

  module ClassMethods
    def translate(key, options = {})
      I18n.translate(i18nable_key_builder.build(key), options)
    end

    def localize(*args)
      I18n.localize(*args)
    end

    private

    def i18nable_key_builder
      KeyBuilder.new(self)
    end
  end
end
