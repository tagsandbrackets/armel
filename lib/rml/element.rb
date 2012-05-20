module RML
  class Element
    def initialize(name, attributes = {}, text = nil, &block)
      @name = name
      @attributes = attributes
      @elements = Elements.new text
      DSL.new(self, &block).build
    end
    
    def elements
      @elements
    end
    
    def add(e)
      @elements.add e
    end
    
    def to_s
      @elements.empty? ? simple_tag : composed_tag
    end
    
    def simple_tag
      "<#{open_tag} />"
    end
    
    def composed_tag
      "<#{open_tag}>#{@elements}</#{@name}>"
    end
        
    def open_tag
      @attributes.empty? ? "#{@name}" : "#{@name} #{@attributes}"
    end
  end
end

