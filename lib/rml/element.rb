class Element
  def initialize(name, &block)
    @name = name
    @elements = []
    DSL.new(self, &block).build
  end
  
  def add(element)
    @elements << element
  end
  
  def to_s
    return "<#{@name}/>" if @elements.empty?
    "<#{@name}>#{@elements.map(&:to_s).join}</#{@name}>"
  end
  
  class DSL
    def initialize(element, &block)
      @element = element
      instance_eval &block if block_given?
    end
    
    def method_missing(method, *args, &block)
      @element.add Element.new(method, &block)
    end
    
    def build
      @element
    end
  end
end
