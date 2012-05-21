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

      def cdata!(text)
        self << CDATA.new(text).to_s
      end

      def comment!(text)
        self << Comment.new(text).to_s
      end

      def method_missing(method, *args, &block)
        @element.add Factory.create(method, *args, &block)
      end

      def build
        @element
      end
    end

    class CDATA
      def initialize(text)
        @val = text
      end

      def to_s
        "<![CDATA[#{@val}]]>"
      end
    end

    class Comment
      def initialize(text)
        @val = text
      end

      def to_s
        "<!-- #{@val} -->"
      end
    end
  end
end
