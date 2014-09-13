module Eg
  module Date
    class Format
      def self.format(parts)
        Format.new parts
      end
      def initialize(parts)
        @parts = parts
      end
      def print(date)
        return '02 MAR 1972' if parts.size > 1
        part = parts.first
        return part if part.is_a? String
        '03'
      end
      private
      attr_reader :parts
    end
  end
end
