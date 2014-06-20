require 'rubygems'
require 'rake/gempackagetask'
require 'rake/testtask'

require File.join(File.dirname(__FILE__), %w(lib simple_gem version))

task :default => :test

spec = Gem::Specification.new do |s|
  s.name             = 'simple-gem'
  s.version          = SimpleGem::Version.to_s
  s.has_rdoc         = true
  s.extra_rdoc_files = %w(README.rdoc)
  s.rdoc_options     = %w(--main README.rdoc)
  s.summary          = "Make gems. Simple."
  s.author           = 'Patrick Reagan'
  s.email            = 'reaganpr@gmail.com'
  s.homepage         = 'http://sneaq.net'
  s.executables      = ['simple-gem']
  s.files            = %w(README.rdoc Rakefile) + Dir.glob("{lib,test,templates}/**/*")

  s.add_development_dependency('rake', '~> 0.8.0')
  s.add_development_dependency('bundler', '~> 1.0.0')
  s.add_development_dependency('jnunemaker-matchy', '~> 0.4.0')
  s.add_development_dependency('shoulda', '~> 2.11.0')
  s.add_development_dependency('mocha', '~> 0.9.0')
end

Rake::GemPackageTask.new(spec) do |pkg|
  pkg.gem_spec = spec
end

Rake::TestTask.new do |t|
  t.libs << 'test'
  t.test_files = FileList["test/**/*_test.rb"]
  t.verbose = true
end

desc 'Generate the gemspec for this Gem'
task :gemspec do
  file = File.dirname(__FILE__) + "/#{spec.name}.gemspec"
  File.open(file, 'w') {|f| f << spec.to_ruby }
  puts "Created gemspec: #{file}"
end

desc 'loads a console with lib/simple_gem.rb'
task :console do
  exec("irb -Ilib -rsimple_gem")
end
