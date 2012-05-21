module RML
  class Element
    class DSL
      class Comment
        def initialize(text = "")
          @val = text
        end

        def to_s
          "<!-- #{@val} -->"
        end
      end
    end
  end
end
