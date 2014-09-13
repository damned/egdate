require_relative 'spec_helper'

require_relative '../lib/egdate/format'

include Eg::Date

describe Format do
  describe '#print' do
    it 'should print padded days' do
      format = Format.format [ :day_padded ]

      expect(format.print date(day: 3)).to eq '03'
    end
    it 'should print literal sequences' do
      format = Format.format [ 'i am a literal' ]

      expect(format.print date()).to eq 'i am a literal'
    end
  end
end
