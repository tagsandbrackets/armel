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
    
    class DSL
      def initialize(element, &block)
        @element = element
        instance_eval &block if block_given?
      end
      
      def <<(text)
        @element.add text
      end
      
      def method_missing(method, *args, &block)
        @element.add Factory.create(method, *args, &block)
      end
      
      def p(*args, &block)
        method_missing(:p, *args, &block)
      end
      
      def build
        @element
      end
    end
    
    class Factory
      class << self
        def create(name, *args, &block)
          elem_args = ElementArgs.new *args
          Element.new(name, elem_args.attributes, elem_args.text, &block)
        end
      end
    end
  end
end

