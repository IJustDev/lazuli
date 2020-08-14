require_relative 'lib/version'

Gem::Specification.new do |spec|
  spec.name          = "lazuli"
  spec.version       = Lazuli::VERSION
  spec.authors       = ["IJustDev"]
  spec.email         = [""]

  spec.summary       = %q{A cli tool that generates templates by using the Product advertising API 5.0}
  spec.description   = %q{}
  spec.homepage      = "https://github.com/ijustdev/lazuli"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "http://mygemserver.com"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/ijustdev/lazuli"
  spec.metadata["changelog_uri"] = "https://github.com/ijustdev/lazuli/changelog.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "bin"
  # spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.executables = ["lazuli"]
  spec.require_paths = ["lib"]
end