# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'easy_threadpool/version'

Gem::Specification.new do |spec|
  spec.name          = "easy_threadpool"
  spec.version       = EasyThreadpool::VERSION
  spec.authors       = ["Francesco Laurita"]
  spec.email         = ["francesco.laurita@gmail.com"]
  spec.description   = %q{An easy to use Thread Pool implementation}
  spec.summary       = %q{
    This gem has been written keeping semplicity in mind
    It implements Thread Pool Pattern described here http://en.wikipedia.org/wiki/Thread_pool_pattern
    Recommended for I/O activities are easily parallelizable, such as downloading
    remote resources, web scraping, bulk API calls, etc 
  }
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
