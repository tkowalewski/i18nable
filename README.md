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

## Usage

```yaml
en:
  amazing_module:
    poor_class:
      mixed_feelings: 'Mixed feelings'

```

```ruby
module AmazingModule
  class PoorClass
    include I18nable

    def what_do_you_feel?
      translate '.mixed_feelings'
    end
  end
end

```

```ruby
poor_class = AmazingModule::PoorClass.new

puts poor_class.what_do_you_feel?
# Mixed feelings
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/tkowalewski/i18nable. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

