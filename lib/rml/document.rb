module RML
  class Document < Element
    def initialize(&block)
      super :root, &block
    end
    
    def to_s
      elements.map(&:to_s).join
    end
    
    class << self
      def string(&block)
        self.new(&block).to_s
      end
    end
  end
end