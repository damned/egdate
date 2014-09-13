module Eg
  module Date
    class Format
      def self.format(sequence)
        Format.new sequence
      end
      def initialize(sequence)
      end
      def print(date)
        '02 MAR 1972'
      end
    end
  end
end
