
require File.join(File.dirname(__FILE__), 'lib/favico/version')

Gem::Specification.new do |s|
  s.name    = "favico"
  s.version = "0.0.1"
  s.date    = "2013-05-26"
  s.summary = "Grabs the favicon of any website you want with a simple interface"
  s.description = %q{Grabs the favicon of any website you want}
  s.authors = ["John Bunting"]
  s.email   = "codingjester@gmail.com"
  s.files   = `git ls-files`.split("\n")
  s.homepage = "http://github.com/codingjester/favico"
  s.require_paths = ["lib"]
  s.version  = Favico::VERSION
end
