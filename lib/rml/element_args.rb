module RML
  class ElementArgs
    def initialize(*args)
      @args = args
    end

    def attributes
      @attributes ||= RML::Attributes.new find_attributes
    end
    
    def text
      @text ||= find_text
    end
    
    def has_text?
      !text.nil?
    end
    
    private
      def find_attributes
        @args.find { |a| a.is_a? Hash } || {}
      end
      
      def find_text
        @args.find { |a| a.is_a? String }
      end
  end
end
