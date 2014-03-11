Gem::Specification.new do |s|
 s.name = 'aftermarket_research'
 s.version = '1.1.0'
 s.date = '2014-03-10'
 s.summary = "Aftermarket Research from your Terminal"
 s.description = "Research and analyze second-hand price information through Craiglist"
 s.authors = ["Daniel Kronovet"]
 s.email = 'kronovet@gmail.com'
 s.homepage =
 'https://github.com/kronosapiens/aftermarket_research'
 s.license = 'GNU GPL V2'
 s.add_runtime_dependency "nokogiri", ["~> 1.6"]
 s.files = Dir['lib/*.rb'] + Dir['bin/*'] + Dir['config/*']
 s.executables = 'aftermarket_research'
end

 # s.files         = `git ls-files`.split($/)
 # s.executables   = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
 # s.test_files    = s.files.grep(%r{^(test|spec|features)/})
 # s.require_paths = ["lib"]