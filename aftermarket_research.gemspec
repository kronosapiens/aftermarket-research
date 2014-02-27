Gem::Specification.new do |s|
 s.name = 'aftermarket_research'
 s.version = '1.0.0'
 s.date = '2014-02-12'
 s.summary = "Aftermarket Research from your Terminal"
 s.description = "Research and analyze second-hand price information through Craiglist"
 s.authors = ["Daniel Kronovet"]
 s.email = 'kronovet@gmail.com'
 s.files         = `git ls-files`.split($/)
 s.executables   = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
 s.test_files    = s.files.grep(%r{^(test|spec|features)/})
 s.require_paths = ["lib"]
 s.homepage =
 'http://rubygems.org/gems/aftermarket_research'
 s.license = 'GNU GPL V2'
 s.add_runtime_dependency "nokogiri", ["~> 1.6"]

end