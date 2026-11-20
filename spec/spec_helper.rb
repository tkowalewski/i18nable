require 'date'
require 'i18nable'

Dir[File.join(__dir__, 'support/**/*.rb')].each { |f| require f }

RSpec.configure do |config|
  config.disable_monkey_patching!
  config.filter_run_when_matching :focus
  config.expect_with(:rspec) { |c| c.syntax = :expect }
end

I18n.config.available_locales = %i[en pl]
I18n.backend.store_translations :en, fake: 'fake',
                                     greeting: 'Hello %<name>s',
                                     a_class: { fake: 'a_class.fake', hello: 'Hi %<name>s' },
                                     b_class: { fake: 'b_class.fake' },
                                     c_module: {
                                       d_class: { fake: 'c_module.d_class.fake' }
                                     }
I18n.backend.store_translations :pl, a_class: { fake: 'a_class.fake.pl' }
