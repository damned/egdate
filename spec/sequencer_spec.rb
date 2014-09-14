require_relative 'spec_helper'
require_relative '../lib/egdate/sequencer'

include Eg::Date

describe Sequencer do
  let(:sequencer) { Sequencer.new }
  describe 'single sequence strings' do
    it 'should recognize single space' do
      sequences = sequencer.sequences ' '

      expect(sequences).to eq [' ']
      expect(sequences.first.type).to eq :literal 
    end
    it 'should recognize a single sequence of spaces' do
      sequences = sequencer.sequences '   '

      expect(sequences.first).to eq '   ' 
      expect(sequences.first.type).to eq :literal
    end
    it 'should recognize alphabetic sequences' do
      sequences = sequencer.sequences 'abc'

      expect(sequences).to eq ['abc']
      expect(sequences.first.type).to eq :alphabetic
    end
  end
  describe 'multiple sequence strings' do
    it 'should recognize a mix of literals and digits' do
      sequences = sequencer.sequences ' 123  '

      expect(sequences).to eq [' ', '123', '  ']
      expect(sequences.map &:type).to eq [:literal, :digit, :literal]
    end
    it 'should recognize a mix including alphabetic' do
      sequences = sequencer.sequences ' 123def xyz '

      expect(sequences).to eq [' ', '123', 'def', ' ', 'xyz', ' ']
      expect(sequences.map &:type).to eq [:literal, :digit, :alphabetic, :literal, :alphabetic, :literal]
    end
  end
end
