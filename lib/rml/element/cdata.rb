module RML
  class Element
    class DSL
      class CDATA
        def initialize(text = "")
          @val = text
        end

        def to_s
          "<![CDATA[#{@val}]]>"
        end
      end
    end
  end
end

