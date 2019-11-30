$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'i18nable'

Dir[File.dirname(__FILE__) + '/support/**/*.rb'].sort.each { |f| require f }

I18n.config.available_locales = :en
I18n.backend.store_translations :en, fake: 'fake',
                                     a_class: { fake: 'a_class.fake' },
                                     b_class: { fake: 'b_class.fake' },
                                     c_module: {
                                       d_class: { fake: 'c_module.d_class.fake' }
                                     }
