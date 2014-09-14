module Eg
  module Date
    class ExampleParser
      def parse(example)
        return [:day_padded, ' ', :month_3_char, ' ', :year_4_digit] if example.start_with?('0')
        parts = []
        last_type = nil
        sequence_length = 0
        index = 0
        example.each_char {|c|
          index += 1
          last_char = index == example.length
          if '.-: '.include? c
            parts << c
            type = :literal 
          else
            type = :digit
          end
          if type == last_type
            sequence_length += 1
          end
          if type != last_type || last_char
            unless last_type.nil?
              if type == :digit
                parts << :year_4_digit
              end
            end
            last_type = type
            sequence_length = 1
          end
        }
        parts
      end
    end
  end
end
