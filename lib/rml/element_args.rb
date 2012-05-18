module RML
  class ElementArgs
    attr_reader :attributes, :text
    
    def initialize(*args)
      @attributes = args.find { |a| a.is_a? Hash } || {}
      @text = args.find { |a| a.is_a? String }
    end
    
    def has_text?
      !@text.nil?
    end
  end
end
