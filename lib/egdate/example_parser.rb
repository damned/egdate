module Eg
  module Date
    class ExampleParser
      def parse(example)
        [:day_padded, ' ', :month_3_char, ' ', :year_4_digit]
      end
    end
  end
end
