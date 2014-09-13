require_relative 'spec_helper'
require_relative '../lib/egdate'

describe 'egdate' do
  it 'should format a date like an example' do
    egdate = EgDate.new date(month: 3, day: 2, year: 1972)

    expect(egdate.like '03 FEB 2001').to eq '02 MAR 1972'
  end

  describe 'delegation to format and example parser' do
    let(:a_date) { date(month: 5, day: 24, year: 2006) }
    let(:format) { double('format') }
    let(:format_spec) { double('format_spec') }
    let(:format_provider) { double('format provider') }
    let(:example_parser) { double('example parser') }

    it 'should use egdate format object to print date to format specified by example parser' do
      example_parser.stub(:parse).with('example').and_return format_spec
      format_provider.stub(:format).with(format_spec).and_return(format)
      format.stub(:print).with(a_date).and_return('formatted date')
      
      formatted = EgDate.new(a_date).like 'example', format_provider: format_provider, example_parser: example_parser

      expect(formatted).to eq 'formatted date'
    end
  end

end
