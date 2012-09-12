# -*- encoding: utf-8 -*-
require File.expand_path('../lib/polygonize/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["milligramme"]
  gem.email         = ["milligramme.cc@gmail.com"]
  gem.description   = %q{convert text to hex array}
  gem.summary       = %q{convert text to hex array}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "polygonize"
  gem.require_paths = ["lib"]
  gem.version       = Polygonize::VERSION
  
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'guard'
  gem.add_development_dependency 'guard-rspec'
  gem.add_development_dependency 'growl'
  gem.add_development_dependency 'rake'
end
