module RML
  class Element
    def initialize(name, *args, &block)
      @name = name
      elem_args = ElementArgs.new *args
      @attributes = elem_args.attributes
      @elements = []
      @elements << elem_args.text if elem_args.has_text?
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
    
    class DSL
      def initialize(element, &block)
        @element = element
        instance_eval &block if block_given?
      end
      
      def <<(text)
        @element.add text
      end
      
      def method_missing(method, *args, &block)
        @element.add Element.new(method, *args, &block)
      end
      
      def p(*args, &block)
        method_missing(:p, *args, &block)
      end
      
      def build
        @element
      end
    end
  end
end

