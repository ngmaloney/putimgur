# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'putimgur/version'

Gem::Specification.new do |gem|
  gem.name          = "putimgur"
  gem.version       = Putimgur::VERSION
  gem.authors       = ["Nick Maloney"]
  gem.email         = ["ngmaloney@gmail.com"]
  gem.description   = %q{A cli app for adding images to imgur.com}
  gem.summary       = %q{A quick way for adding images to imgur.com}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.add_development_dependency('rdoc')
  gem.add_development_dependency('aruba')
  gem.add_development_dependency('rake', '~> 0.9.2')
  gem.add_development_dependency('debugger')
  gem.add_dependency('methadone', '~> 1.2.2')
end
