module ARMEL
  class Elements
    def initialize(*elements)
      @elements = []
      elements.each { |e| add e }
    end
    
    def add(element)
      @elements << element if element
      element
    end
    
    def empty?
      @elements.empty?
    end
    
    def to_s
      @elements.map(&:to_s).join
    end
  end
end
