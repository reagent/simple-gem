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
    
    private
    def transform_name(glue = nil, &block)
      # pattern = /_/
      self.name.split(/[_-]/).map {|part| block.call(part) }.join(glue)
    end
    
  end
end