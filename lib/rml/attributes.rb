module RML
  class Attributes
    def initialize(attr_hash)
      @attrs = attr_hash
    end
    
    def to_s
      @attrs.map { |k, v| "#{k}='#{v}'" }.join ' '
    end
    
    class << self
      def string(attr_hash)
        self.new(attr_hash).to_s
      end
    end
  end
end
