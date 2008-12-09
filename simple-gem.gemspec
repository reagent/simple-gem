# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{simple-gem}
  s.version = "0.2.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Patrick Reagan"]
  s.date = %q{2008-12-09}
  s.default_executable = %q{simple-gem}
  s.email = %q{reaganpr@gmail.com}
  s.executables = ["simple-gem"]
  s.extra_rdoc_files = ["README.markdown"]
  s.files = ["README.markdown", "Rakefile", "lib/simple_gem", "lib/simple_gem/gem.rb", "lib/simple_gem/version.rb", "lib/simple_gem.rb", "test/simple_gem", "test/simple_gem/gem_test.rb", "templates/lib.rb.erb", "templates/lib_version.rb.erb", "templates/Rakefile.erb", "templates/README.markdown.erb", "templates/test.rb.erb", "templates/test_helper.rb.erb", "bin/simple-gem"]
  s.has_rdoc = true
  s.homepage = %q{http://sneaq.net}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Make gems. Simple.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
