module SimpleGem
  class Gem

    attr_reader :root_path, :name

    def initialize(path, name)
      @root_path = path
      self.name = name
    end

    def name=(name)
      @name = name.gsub(/([A-Z])([a-z])/, '_\1\2').sub(/^_/, '').downcase
    end

    def module_name
      transform_name {|part| part.capitalize }
    end

    def ruby_name
      transform_name('_') {|part| part.downcase }
    end

    def generate
      generate_root_directory
      generate_subdirectories
      generate_file('gitignore.erb', '.gitignore')
      generate_file('lib.rb.erb', "lib/#{self.ruby_name}.rb")
      generate_file('lib_version.rb.erb', "lib/#{self.ruby_name}/version.rb")
      generate_file('Rakefile.erb', 'Rakefile')
      generate_file('Gemfile.erb', 'Gemfile')
      generate_file('README.rdoc.erb', 'README.rdoc')
      generate_file('test_helper.rb.erb', 'test/test_helper.rb')
      generate_file('test.rb.erb', "test/unit/#{self.ruby_name}_test.rb")
    end

    private
    def transform_name(glue = nil, &block)
      self.name.split(/[_-]/).map {|part| block.call(part) }.join(glue)
    end

    def generate_root_directory
      FileUtils.mkdir("#{self.root_path}/#{self.name}")
    end

    def generate_subdirectories
      ['lib', 'test', "lib/#{self.ruby_name}", 'test/unit'].each do |dir|
        FileUtils.mkdir("#{self.root_path}/#{self.name}/#{dir}")
      end
    end

    def generate_file(source, output)
      source_file = File.dirname(__FILE__) + "/../../templates/#{source}"
      output_file = "#{self.root_path}/#{self.name}/#{output}"

      erb = ERB.new(File.read(source_file))
      File.open(output_file, 'w') {|f| f << erb.result(binding) }
    end

  end
end