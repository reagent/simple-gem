require 'rubygems'
require 'rake/gempackagetask'

require 'lib/simple_gem'

spec = Gem::Specification.new do |s|
  s.name             = 'simple-gem'
  s.version          = SimpleGem::Version.to_s
  s.has_rdoc         = true
  s.extra_rdoc_files = %w(README.markdown)
  s.summary          = "A simple start point for creating gems"
  s.author           = 'Patrick Reagan'
  s.email            = 'reaganpr@gmail.com'
  s.homepage         = 'http://sneaq.net'
  s.executables      = ['simple-gem']
  s.files            = %w(README.markdown Rakefile) + Dir.glob("{lib,test,templates}/**/*")
end

Rake::GemPackageTask.new(spec) do |pkg|
  pkg.gem_spec = spec
end

desc 'Generate the gemspec to serve this Gem from Github'
task :github do
  file = File.dirname(__FILE__) + "/#{spec.name}.gemspec"
  File.open(file, 'w') {|f| f << spec.to_ruby }
  puts "Created gemspec: #{file}"
end