# I18nable

Use I18n within any class

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'i18nable'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install i18nable

## Requirements

- Ruby >= 3.1
- `i18n` >= 1.8 (works standalone or with Rails)

## Usage

Include `I18nable` in any class. Keys starting with a dot are scoped by the underscored class name
(`AmazingModule::PoorClass` becomes `amazing_module.poor_class`); other keys are passed to I18n unchanged.

```yaml
en:
  amazing_module:
    poor_class:
      mixed_feelings: 'Mixed feelings'
      greeting: 'Hello %{name}'
```

```ruby
module AmazingModule
  class PoorClass
    include I18nable

    def what_do_you_feel?
      translate '.mixed_feelings'
    end

    def greet(name)
      translate '.greeting', name: name
    end
  end
end

poor_class = AmazingModule::PoorClass.new
poor_class.what_do_you_feel? # => "Mixed feelings"
poor_class.greet('Ann')      # => "Hello Ann"
AmazingModule::PoorClass.translate '.mixed_feelings' # also available on the class
```

### Options

`translate` accepts any `I18n.translate` option (`locale:`, `default:`, `count:`, `raise:`, interpolation values)
as keyword arguments. `localize(object, **options)` delegates to `I18n.localize`.

```ruby
translate '.mixed_feelings', locale: :pl, default: 'n/a'
localize Date.today, format: :short
```

Keys without a leading dot or non-String keys (e.g. `:fake`) are not scoped. Anonymous classes
cannot be scoped and raise `ArgumentError`.

### Rails

Put translations in `config/locales/*.yml` under the underscored class path and include `I18nable`
in models, services or any plain Ruby object.

## Development

Run `bin/setup` to install dependencies, `bundle exec rake` to run specs and RuboCop, and `bin/console` for an
interactive prompt. To release, update `lib/i18nable/version.rb` and `CHANGELOG.md`, then run `bundle exec rake release`.
See [CONTRIBUTING.md](CONTRIBUTING.md).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/tkowalewski/i18nable. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

