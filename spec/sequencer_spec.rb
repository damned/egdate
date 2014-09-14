require_relative 'spec_helper'
require_relative '../lib/egdate/sequencer'

include Eg::Date

describe Sequencer do
  let(:sequencer) { Sequencer.new }
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
end
