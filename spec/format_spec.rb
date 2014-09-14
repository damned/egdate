require_relative 'spec_helper'

require_relative '../lib/egdate/format'

include Eg::Date

describe Format do
  it 'should let you know if you use an unknown part specifier' do
    expect {
      Format.format [ :not_really_a_format_specifier_part ]
    }.to raise_error do |error|
      fail 'not checked error message yet'
    end
  end
  describe '#print' do
    describe 'individual format parts' do
      it 'should print padded days' do
        format = Format.format [ :day_padded ]

        expect(format.print date(day: 3)).to eq '03'
      end
      it 'should print literal sequences' do
        format = Format.format [ 'i am a literal' ]

        expect(format.print date()).to eq 'i am a literal'
      end
      it 'should print a month as three characters' do
        format = Format.format [ :month_3_char ]

        expect(format.print date(month: 7)).to eq 'JUL'
      end
      it 'should print a full year' do
        format = Format.format [ :year_4_digit ]

        expect(format.print date(year: 1977)).to eq '1977'
      end
    end
    describe 'multiple format parts' do
    end
  end
  describe 'self.format' do
    it 'should allow single argument passed directly or as array' do
      expect(Format.format([ :day_padded ]).print(date)).to eq Format.format(:day_padded).print(date)
    end
  end
end
