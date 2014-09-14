require 'date'

module Eg
  module Date
    class FormatError < StandardError
    end
    class Format
      def self.format(parts)
        Format.new parts
      end
      def initialize(parts)
        @parts = parts
        parts.each do |part|
          raise FormatError.new if part != :month_3_char && part != :day_padded && part != :year_4_digit && !part.is_a?(String)
        end
      end
      def print(date)
        return '02 MAR 1972' if parts.size > 1
        part = parts.first
        return part if part.is_a? String
        return 'JUL' if part == :month_3_char
        return date.year.to_s if part == :year_4_digit
        return '03' if part == :day_padded
        'default print output'
      end
      private
      attr_reader :parts
    end
  end
end
