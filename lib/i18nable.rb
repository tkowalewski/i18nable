require 'i18n'
require 'i18nable/version'
require 'i18nable/key_builder'

module I18nable
  def self.included(base)
    base.extend ClassMethods
    base.include InstanceMethods
  end

  module InstanceMethods
    # @see ClassMethods#translate
    def translate(key, **options)
      self.class.translate(key, **options)
    end

    # @see ClassMethods#localize
    def localize(object, **options)
      self.class.localize(object, **options)
    end
  end

  module ClassMethods
    # Translates a key; keys starting with '.' are scoped by the underscored class name.
    # @param key [String, Symbol]
    # @param options [Hash] any I18n.translate option
    # @return [String]
    # @example
    #   translate '.title' # looks up "my_class.title"
    def translate(key, **options)
      I18n.translate(i18nable_key_builder.build(key), **options)
    end

    # @see I18n.localize
    def localize(object, **options)
      I18n.localize(object, **options)
    end

    private

    def i18nable_key_builder
      KeyBuilder.new(self)
    end
  end
end
