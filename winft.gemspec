# frozen_string_literal: true

require_relative "lib/winft/version"

Gem::Specification.new do |spec|
  spec.name = "winft"
  spec.version = Winft::VERSION
  spec.authors = ["Jesse vonBergen"]
  spec.email = ["jvon1904@gmail.com"]

  spec.summary = spec.description = "Extends Ruby's Time class for parsing Windows FILETIME formats"
  spec.homepage = "https://github.com/jvon1904/winft"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.0.0"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.metadata["rubygems_mfa_required"] = "true"
end
