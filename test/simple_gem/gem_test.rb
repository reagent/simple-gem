require 'rubygems'
require 'test/unit'
require 'shoulda'
require 'matchy'

require File.expand_path(File.join(File.dirname(__FILE__), %w(.. .. lib simple_gem)))

module SimpleGem
  class GemTest < Test::Unit::TestCase

    def self.should_generate(expectations)
      name = expectations[:from].sub(/\W/, '')
      context "An instance of Gem when given the name: #{name} name" do
        setup do
          path = '/this/path'
          @name = expectations[:from]
          @gem = Gem.new(path, @name)
        end

        expectations.each do |k,v|
          unless k == :from
            should "know its #{k}" do
              @gem.send(k).should == v
            end
          end
        end
      end
    end

    should_generate :name => 'simple_gem', 
    :module_name => 'SimpleGem', 
    :ruby_name   => 'simple_gem', 
    :from        => 'SimpleGem'


    should_generate :name => 'simple-gem', 
    :module_name => 'SimpleGem', 
    :ruby_name   => 'simple_gem', 
    :from        => 'simple-gem'

    should_generate :name => 'simple_gem', 
    :module_name => 'SimpleGem', 
    :ruby_name   => 'simple_gem', 
    :from        => 'simple_gem'

    should_generate :name => 'simple_gem', 
    :module_name => 'SimpleGem', 
    :ruby_name   => 'simple_gem', 
    :from        => 'simpleGem'

    context "An instance of the Gem class" do
      setup { @path = '/this/path' }

      should " know its root path" do
        Gem.new(@path, 'name').root_path.should == @path
      end

      context "when generating the directory structure" do

        setup do
          @tmp_dir = File.dirname(__FILE__) + '/../../tmp'
          FileUtils.mkdir(@tmp_dir) unless File.exist?(@tmp_dir)

          @name = 'simple-gem'
          Gem.new(@tmp_dir, @name).generate
        end

        teardown do
          FileUtils.rm_rf(@tmp_dir)
        end

        should "be able to make the root directory" do
          File.exist?("#{@tmp_dir}/#{@name}").should == true
        end

        %w(lib test lib/simple_gem test/unit).each do |dir|
          should "create the #{dir} subdirectory" do
            File.exist?("#{@tmp_dir}/#{@name}/#{dir}").should == true
          end
        end

        should "create the main library file" do
          File.exist?("#{@tmp_dir}/#{@name}/lib/simple_gem.rb").should == true
        end
        
        should "create the version file" do
          File.exist?("#{@tmp_dir}/#{@name}/lib/simple_gem/version.rb").should == true
        end

        should "create the main Rakefile" do
          File.exist?("#{@tmp_dir}/#{@name}/Rakefile").should == true
        end

        should "create the README file" do
          File.exist?("#{@tmp_dir}/#{@name}/README.rdoc").should == true
        end

        should "generate the test helper file" do
          File.exist?("#{@tmp_dir}/#{@name}/test/test_helper.rb").should == true
        end

        should "generate the test file" do
          File.exist?("#{@tmp_dir}/#{@name}/test/unit/simple_gem_test.rb").should == true
        end
        
        should "generate the .gitignore file" do
          File.exist?("#{@tmp_dir}/#{@name}/.gitignore").should == true
        end

      end

    end
  end
end