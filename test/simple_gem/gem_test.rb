require 'rubygems'
require 'context'
require 'matchy'

require File.dirname(__FILE__) + '/../../lib/simple_gem/gem'

module SimpleGem
  class GemTest < Test::Unit::TestCase

    def self.should_generate(expectations)
      context "when given a #{expectations[:from]} name" do
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

    should_generate :name => 'simple_gem', :module_name => 'SimpleGem', :ruby_name => 'simple_gem', :from => 'SimpleGem'
    should_generate :name => 'simple-gem', :module_name => 'SimpleGem', :ruby_name => 'simple_gem', :from => 'simple-gem'
    should_generate :name => 'simple_gem', :module_name => 'SimpleGem', :ruby_name => 'simple_gem', :from => 'simple_gem'
    should_generate :name => 'simple_gem', :module_name => 'SimpleGem', :ruby_name => 'simple_gem', :from => 'simpleGem'

    describe "An instance of Gem" do
      before { @path = '/this/path' }
      
      it "should know its root path" do
        Gem.new(@path, 'name').root_path.should == @path
      end
      
    end
    
  end
end