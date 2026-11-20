module I18nable
  class KeyBuilder
    def initialize(base_class)
      @base_class = base_class
    end

    def build(key)
      return key unless key.is_a?(String) && scopable?(key)

      "#{scope}#{key}"
    end

    private

    def scopable?(key)
      key.start_with? '.'
    end

    def scope
      @scope ||= class_name.gsub(%r{/_?}, '.')
    end

    def class_name
      name = @base_class.name
      raise ArgumentError, 'I18nable cannot build keys for anonymous classes' if name.nil?

      underscore name
    end

    def underscore(key)
      key.gsub('::', '/').gsub(/([A-Z]+)([A-Z][a-z])/, '\1_\2').gsub(/([a-z\d])([A-Z])/, '\1_\2').tr('-', '_').downcase
    end
  end
end
