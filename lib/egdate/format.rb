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
          raise FormatError.new unless part_formats.has_key?(part) || part.is_a?(String)
        end
      end
      def print(date)
        parts.map { |part|
          if part.is_a? String
            part 
          elsif part_formats.has_key? part 
            date.strftime(part_formats[part]).upcase
          else
            ''
          end
        }.join
      end
      
      private
      attr_reader :parts
      
      STRFTIME_FORMATS = {
        month_3_char: '%b', 
        year_4_digit: '%Y', 
        day_padded: '%d'
      }
      
      def part_formats
        STRFTIME_FORMATS
      end
    end
  end
end
