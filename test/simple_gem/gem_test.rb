require 'rubygems'
require 'context'
require 'matchy'

require File.dirname(__FILE__) + '/../../lib/simple_gem/gem'

module SimpleGem
  class GemTest < Test::Unit::TestCase

    def self.should_generate(expectations)
      describe "An instance of Gem when given a #{expectations[:from]} name" do
        before do
          path = '/this/path'
          @name = expectations[:from]
          @gem = Gem.new(path, @name)
        end

        expectations.each do |k,v|
          unless k == :from
            it "should know its #{k}" do
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

    describe "An instance of Gem" do
      before { @path = '/this/path' }

      it "should know its root path" do
        Gem.new(@path, 'name').root_path.should == @path
      end

      context "when generating the directory structure" do

        before do
          @tmp_dir = File.dirname(__FILE__) + '/../../tmp'
          FileUtils.mkdir(@tmp_dir) unless File.exist?(@tmp_dir)

          @name = 'simple-gem'
          Gem.new(@tmp_dir, @name).generate
        end

        after do
          FileUtils.rm_rf(@tmp_dir)
        end

        it "should be able to make the root directory" do
          File.exist?("#{@tmp_dir}/#{@name}").should == true
        end

        %w(lib test lib/simple_gem test/unit).each do |dir|
          it "should create the #{dir} subdirectory" do
            File.exist?("#{@tmp_dir}/#{@name}/#{dir}").should == true
          end
        end

        it "should create the main library file" do
          File.exist?("#{@tmp_dir}/#{@name}/lib/simple_gem.rb").should == true
        end
        
        it "should create the version file" do
          File.exist?("#{@tmp_dir}/#{@name}/lib/simple_gem/version.rb").should == true
        end

        it "should create the main Rakefile" do
          File.exist?("#{@tmp_dir}/#{@name}/Rakefile").should == true
        end

        it "should create the README file" do
          File.exist?("#{@tmp_dir}/#{@name}/README.rdoc").should == true
        end

        it "should generate the test helper file" do
          File.exist?("#{@tmp_dir}/#{@name}/test/test_helper.rb").should == true
        end

        it "should generate the test file" do
          File.exist?("#{@tmp_dir}/#{@name}/test/unit/simple_gem_test.rb").should == true
        end

      end

    end
  end
end