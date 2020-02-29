lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'i18nable/version'

Gem::Specification.new do |spec|
  spec.name          = 'i18nable'
  spec.version       = I18nable::VERSION
  spec.authors       = ['tkowalewski']
  spec.email         = ['me@tkowalewski.pl']
  spec.summary       = 'Use I18n within any class'
  spec.description   = ''
  spec.homepage      = 'https://github.com/tkowalewski/i18nable'
  spec.license       = 'MIT'
  spec.files         = Dir['CHANGELOG.md', 'CODE_OF_CONDUCT.md', 'LICENSE.txt', 'README.md', 'lib/**/*']
  spec.require_paths = ['lib']
  spec.add_runtime_dependency 'i18n'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec', '~> 3.5.0'
  spec.add_development_dependency 'rubocop', '>= 0.49.0'
  spec.add_development_dependency 'pry', '~> 0.10.4'
end
