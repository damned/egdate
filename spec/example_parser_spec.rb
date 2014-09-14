require_relative 'spec_helper'
require_relative '../lib/egdate/example_parser'

include Eg::Date

describe ExampleParser do
  let(:parser) { ExampleParser.new }
  it 'should take spaces literally' do
    expect(parser.parse ' ').to eq [' ']
  end
  it 'should take punctuation literally' do
    expect(parser.parse '.-:').to eq ['.', '-',':']
  end
  it 'should take four digits to be a year' do
    expect(parser.parse '1234').to eq [:year_4_digit]
  end
end
