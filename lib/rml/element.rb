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
      return "<#{open_tag} />" if @elements.empty?
      "<#{open_tag}>#{@elements.map(&:to_s).join}</#{@name}>"
    end
    
    def open_tag
      "#{@name}#{attrs_to_s}"
    end
    
    def attrs_to_s
      @attributes.inject("") { |str, (k, v)| str << " #{k}='#{val_to_s v}'" }
    end
    
    def val_to_s(val)
      val.is_a?(Array) ? val.join(" ") : val
    end
    
    def method_missing(method, *args, &block)
      @attributes[:class] ||= [] 
      @attributes[:class] << method.to_s
      DSL.new(self, &block).build
      self
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

