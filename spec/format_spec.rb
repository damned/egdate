require_relative 'spec_helper'

require_relative '../lib/egdate/format'

include Eg::Date

describe Format do
  def format(*parts)
    Format.format parts
  end
  describe '#print' do
    describe 'individual format parts' do
      it 'should print padded days' do
        expect(format(:day_padded).print date(day: 3)).to eq '03'
      end
      it 'should print literal strings' do
        expect(format('i am a literal').print date()).to eq 'i am a literal'
      end
      it 'should print a month as three characters' do
        expect(format(:month_3_char).print date(month: 7)).to eq 'JUL'
      end
      it 'should print a full year' do
        expect(format(:year_4_digit).print date(year: 1977)).to eq '1977'
      end
    end
    describe 'multiple format parts' do
      it 'should print multiple literal strings' do
        expect(format('i', ' ', 'am', ' ', 'literals').print date()).to eq 'i am literals'
      end
      it 'should print a mix of literals and date part specifiers' do
        format = format(:year_4_digit, '-', :month_3_char, '-', :day_padded, '!')
        expect(format.print date(year: 2011, month: 5, day: 17)).to eq '2011-MAY-17!'
      end
    end
  end
  describe 'self.format' do
    it 'should let you know if you use an unknown part specifier' do
      expect {
        Format.format [ :not_really_a_format_specifier_part ]
      }.to raise_error do |error|
        fail 'not checked error message yet'
      end
    end
    it 'should allow single argument passed directly or as array' do
      expect(Format.format([ :day_padded ]).print(date)).to eq Format.format(:day_padded).print(date)
    end
  end
end
