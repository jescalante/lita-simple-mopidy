Gem::Specification.new do |spec|
  spec.name          = "lita-simple-mopidy"
  spec.version       = "0.0.1"
  spec.authors       = ["José Escalante"]
  spec.email         = ["joe.escalante@gmail.com"]
  spec.description   = %q{ Mopidy simple handler for Lita }
  spec.summary       = %q{ Mopidy simple handler for Lita }
  spec.homepage      = "https://github.com/jescalante/lita-simple-mopidy"
  spec.license       = "MIT"
  spec.metadata      = { "lita_plugin_type" => "handler" }

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "lita", ">= 4.0"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rack-test"
  spec.add_development_dependency "rspec", ">= 3.0.0"
end
