require_relative 'lib/i18nable/version'

Gem::Specification.new do |spec|
  spec.name          = 'i18nable'
  spec.version       = I18nable::VERSION
  spec.authors       = ['tkowalewski']
  spec.email         = ['me@tkowalewski.pl']
  spec.summary       = 'Use I18n within any class'
  spec.description   = 'Adds translate and localize helpers to any Ruby class, ' \
                       'with keys starting with a dot scoped by the class name.'
  spec.homepage      = 'https://github.com/tkowalewski/i18nable'
  spec.license       = 'MIT'
  spec.required_ruby_version = '>= 3.1'
  spec.metadata      = {
    'homepage_uri' => spec.homepage,
    'source_code_uri' => spec.homepage,
    'changelog_uri' => "#{spec.homepage}/blob/master/CHANGELOG.md",
    'bug_tracker_uri' => "#{spec.homepage}/issues",
    'rubygems_mfa_required' => 'true'
  }
  spec.files         = Dir['CHANGELOG.md', 'CODE_OF_CONDUCT.md', 'LICENSE.txt', 'README.md', 'lib/**/*']
  spec.require_paths = ['lib']
  spec.add_dependency 'i18n'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec', '~> 3.5.0'
  spec.add_development_dependency 'rubocop', '>= 0.49.0'
end
