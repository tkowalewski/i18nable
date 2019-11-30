module I18nable
  class KeyBuilder
    def initialize(base_class)
      @base_class = base_class
    end

    def build(key)
      return key unless key.is_a?(String) && scopable?(key)

      scope.concat key
    end

    private

    def scopable?(key)
      key.start_with? '.'
    end

    def scope
      @scope ||= class_name.gsub(%r{/_?}, '.')
    end

    def class_name
      underscore @base_class.name
    end

    def underscore(key)
      key.gsub(/::/, '/').gsub(/([A-Z]+)([A-Z][a-z])/, '\1_\2').gsub(/([a-z\d])([A-Z])/, '\1_\2').tr('-', '_').downcase
    end
  end
end
