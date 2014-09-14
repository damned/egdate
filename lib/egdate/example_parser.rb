require_relative 'sequencer'

module Eg
  module Date
    class ExampleParser
      def initialize(sequencer: Sequencer.new)
        @sequencer = sequencer
      end

      def parse(example)
        return [:day_padded, ' ', :month_3_char, ' ', :year_4_digit] if example.start_with?('0')
        parts = []
        sequencer.sequences(example).each { |type_and_sequence|  
          type, sequence = type_and_sequence
          if type == :literal
            parts += sequence.each_char.to_a
          elsif type == :digit
            parts << :year_4_digit
          end 
        }
        parts
      end

      private

      attr_reader :sequencer

    end
  end
end
