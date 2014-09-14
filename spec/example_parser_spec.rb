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
  it 'should take the first three characters of a month to be a 3-char month' do
    expect(parser.parse 'jan').to eq [:month_3_char]
  end
  xit 'should take two digits to be a year when they are greater than 31 so cannot be a day of the month' do
    expect(parser.parse '32').to eq [:year_2_digit]
  end
end
