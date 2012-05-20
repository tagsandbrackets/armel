module RML
  class Element
    def initialize(name, attributes = {}, text = nil, &block)
      @name = name
      @attributes = attributes
      @elements = []
      add(text) if text
      DSL.new(self, &block).build
    end
    
    def add(element)
      @elements << element
      element
    end
    
    def elements
      @elements
    end
    
    def to_s
      @elements.empty? ? simple_tag : composed_tag
    end
    
    def simple_tag
      "<#{open_tag} />"
    end
    
    def composed_tag
      "<#{open_tag}>#{elements_to_s}</#{@name}>"
    end
        
    def open_tag
      @attributes.empty? ? "#{@name}" : "#{@name} #{@attributes}"
    end
    
    def elements_to_s
      @elements.map(&:to_s).join
    end
  end
end

