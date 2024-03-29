module ARMEL
  class Attributes
    def initialize(attr_hash, ns = nil)
      @attrs = attr_hash ||= {}
      @ns = ns
    end
    
    def empty?
      @attrs.empty?
    end
    
    def to_s
      @attrs.map { |k, v| attr_s k, v }.compact.join ' '
    end
    
    class << self
      def string(attr_hash, ns = nil)
        new(attr_hash, ns).to_s
      end
    end
    
    private
      def attr_s(attr, val)
        return self.class.string(val, attr) if val.is_a? Hash
        @ns ? _attr_s("#{@ns}:#{attr}", val) : _attr_s(attr, val)
      end
      
      def _attr_s(attr, val)
        case val
          when nil then nil
          when Fixnum then "#{attr}=#{val}"
          when String then "#{attr}='#{val}'"
          else "#{attr}='#{val.to_s}'" 
        end
      end
  end
end
