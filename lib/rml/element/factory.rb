module RML
  class Element
    class Factory
      class << self
        def create(name, *args, &block)
          elem_args = ElementArgs.new *args
          Element.new(name, elem_args.attributes, elem_args.text, &block)
        end
      end
    end
  end
end
