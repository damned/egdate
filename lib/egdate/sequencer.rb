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
        sequences = []
        last_type = nil
        index = 0
        sequence = ''
        string.each_char {|c|
          index += 1
          last_char = index == string.length
          if '.-: '.include? c
            type = :literal 
          else
            type = :digit
          end
          sequence = '' if type != last_type
          sequence += c
          if last_char || (type != last_type && !last_type.nil?)
            sequence.extend Typed
            sequence.type = type
            sequences << sequence
          end
          last_type = type
        }
        sequences
      end
    end
  end
end
