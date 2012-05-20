module RML
  class Element
    class Factory
      class << self
        def create(name, *args, &block)
          elem_args = Args.new *args
          Element.new(name, elem_args.attributes, elem_args.elements, &block)
        end
      end
      
      class Args
        def initialize(*args)
          @args = args
        end

        def attributes
          @attributes ||= RML::Attributes.new find_attributes
        end
        
        def elements
          @elements ||= Elements.new find_text
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
  end
end
