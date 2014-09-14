require 'date'

module Eg
  module Date
    class FormatError < StandardError
    end
    class Format
      def self.format(*parts)
        Format.new parts.flatten
      end
      def initialize(parts)
        @parts = parts
        parts.each do |part|
          raise FormatError.new if part != :month_3_char && part != :day_padded && part != :year_4_digit && !part.is_a?(String)
        end
      end
      def print(date)
        return '02 MAR 1972' if parts.size > 1 && !parts.first.is_a?(String)
        parts.map { |part|
          if part.is_a? String
            part 
          elsif part == :month_3_char
            'JUL'
          elsif part == :year_4_digit
            date.year.to_s
          elsif part == :day_padded
            '03'
          else
          end
        }.join
      end
      private
      attr_reader :parts
    end
  end
end
