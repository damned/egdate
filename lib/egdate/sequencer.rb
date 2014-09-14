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
        
        string.split(/(\d+)/).map {|s|s.split(/([A-z]+)/)}.flatten.reject(&:empty?).map { |sequence|
          sequence.extend Typed
          if !sequence.match(/\d/).nil?
            sequence.type = :digit
          elsif !sequence.match(/[A-z]/).nil?
            sequence.type = :alphabetic
          else
            sequence.type = :literal
          end
          sequence
        }  
      end
    end
  end
end
