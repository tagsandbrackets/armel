module RML
  class Element
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
  end
end
