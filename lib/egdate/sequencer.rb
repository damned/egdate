require_relative 'sequencer'

module Eg
  module Date
    class Sequencer
      module Typed
        def type
          @type
        end
        def type=(type)
          @type = type
        end
      end

      def sequences(string)
        sequences = split_by_type(string)
        sequences.map { |sequence|
          sequence.extend Typed
          sequence.type = type_of(sequence) 
          sequence
        }  
      end

      private

      def split_by_type(string)
        matchers.values.inject([string]) {|parts, matcher|
          parts = parts.collect {|part|
            part.split(matcher)
          }.flatten
        }.reject(&:empty?)
      end
  
      def type_of(sequence)
        matchers.each { |type, matcher|
          unless sequence.match(matcher).nil?
            return type
          end
        }
        :literal
      end

      TYPED_SEQUENCE_MATCHERS = {
        digit: /(\d+)/,
        alphabetic: /([A-z]+)/
      }

      def matchers
        TYPED_SEQUENCE_MATCHERS 
      end
    end
  end
end
