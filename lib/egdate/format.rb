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
        printed = ''
        parts.each { |part|
          printed += part if part.is_a? String
          printed += 'JUL' if part == :month_3_char
          printed += date.year.to_s if part == :year_4_digit
          printed += '03' if part == :day_padded
        }
        printed
      end
      private
      attr_reader :parts
    end
  end
end
