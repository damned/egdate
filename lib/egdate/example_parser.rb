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
        sequencer.sequences(example).each { |sequence|  
          if sequence.type == :literal
            parts += sequence.each_char.to_a
          elsif sequence.type == :digit
            parts << :year_4_digit
          elsif sequence.type == :alphabetic
            parts << :month_3_char
          end 
        }
        parts
      end

      private

      attr_reader :sequencer

    end
  end
end
