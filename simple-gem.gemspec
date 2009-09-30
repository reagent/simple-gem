# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{simple-gem}
  s.version = "0.4.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Patrick Reagan"]
  s.date = %q{2009-09-30}
  s.default_executable = %q{simple-gem}
  s.email = %q{reaganpr@gmail.com}
  s.executables = ["simple-gem"]
  s.extra_rdoc_files = ["README.rdoc"]
  s.files = ["README.rdoc", "Rakefile", "lib/simple_gem", "lib/simple_gem/gem.rb", "lib/simple_gem/version.rb", "lib/simple_gem.rb", "test/simple_gem", "test/simple_gem/gem_test.rb", "templates/gitignore.erb", "templates/lib.rb.erb", "templates/lib_version.rb.erb", "templates/Rakefile.erb", "templates/README.rdoc.erb", "templates/test.rb.erb", "templates/test_helper.rb.erb", "bin/simple-gem"]
  s.homepage = %q{http://sneaq.net}
  s.rdoc_options = ["--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.4}
  s.summary = %q{Make gems. Simple.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
