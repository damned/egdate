require_relative 'spec_helper'
require_relative '../lib/egdate'

describe 'egdate' do
  it 'should format a date like an example' do
    egdate = EgDate.new date(month: 3, day: 2, year: 1972)

    expect(egdate.like '03 FEB 2001').to eq '02 MAR 1972'
  end

  it 'should use egdate format object to format output' do
    egdate = EgDate.new date(month: 5, day: 24, year: 2006)
    format = double('format', print: 'formatted date')
    format_provider = double('format provider', format: format)
    
    formatted = egdate.like '04 JUN 2011', format_provider: format_provider

    expect(formatted).to eq 'formatted date'
    expect(format_provider).to have_received(:format).with([:day_padded, ' ', :month_3_char, ' ', :year_4_digit])
  end
end
