module ARMEL
  class Document < Element
    def initialize(elements = nil, &block)
      super :root, {}, elements || Elements.new, &block
    end
    
    def to_s
      elements.to_s
    end
    
    class << self
      def string(&block)
        self.new(&block).to_s
      end
    end
  end
end
