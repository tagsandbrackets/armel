class Element
  def initialize(name, attributes = {}, &block)
    @name = name
    @attributes = attributes
    @elements = []
    DSL.new(self, &block).build
  end
  
  def add(element)
    @elements << element
  end
  
  def to_s
    return "<#{open_tag}/>" if @elements.empty?
    "<#{@name}>#{@elements.map(&:to_s).join}</#{@name}>"
  end
  
  def open_tag
    "#{@name}#{attrs_to_s}"
  end
  
  def attrs_to_s
    @attributes.inject(" ") { |str, (k, v)| str << "#{k}='#{v}' " }
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
