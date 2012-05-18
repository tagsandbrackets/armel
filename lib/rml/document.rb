module RML
  class Document
    def initialize(&block)
      @root = Element.new :root, &block
    end
    
    def root
      @root
    end
    
    def to_s
      @root.elements.map(&:to_s).join
    end
    
    class << self
      def string(&block)
        self.new(&block).to_s
      end
    end
  end
end
