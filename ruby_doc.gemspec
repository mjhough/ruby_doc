
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "ruby_doc/version"

Gem::Specification.new do |spec|
  spec.name          = "ruby_doc"
  spec.version       = RubyDoc::VERSION
  spec.authors       = ["Daniel Nunez"]
  spec.email         = ["daniel.nunez.nyc@gmail.com"]

  spec.summary       = %q{A CLI Gem that scrapes Ruby documentation.}
  spec.description   = %q{Ever get tired of leaving your editor/environment to google a method, or more in depth info on a class or module? This gem aims to make Ruby referencing quick and more importantly, LOCAL! Ruby Doc scrapes Ruby documentation and allows users to quickly reference Ruby Language methods and additional information all your terminal. Have a query? run, hunt, and done. Never lose momentum, keep all things in your line of sight and get right back to coding. Enjoy.}
  spec.homepage      = "https://github.com/AlphaDaniel/Alpha-Ruby_Doc"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "bin"
  spec.executables   = ['ruby_doc']
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency 'rspec', '~> 3.7', '>= 3.7.0'
  spec.add_development_dependency "pry", "~>0.11.3"
#============================================== 
  spec.add_dependency "colorize", "~>0.8.1"
  spec.add_runtime_dependency 'nokogiri', '~> 1.8', '>= 1.8.1'
#============================================== 
end
