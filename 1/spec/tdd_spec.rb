require 'spec_helper'

describe IntegerGrouper do
  describe '#format' do
    context 'none commas output' do
      it{ expect(formatted_number(0)).to eq('0') }
      it{ expect(formatted_number(9)).to eq('9') }
      it{ expect(formatted_number(10)).to eq('10')}
      it{ expect(formatted_number(19)).to eq('19')}
      it{ expect(formatted_number(100)).to eq('100')}
    end

    context 'one comma output' do
      it{ expect(formatted_number(1_000)).to eq('1,000') }
      it{ expect(formatted_number(9_999)).to eq('9,999') }
      it{ expect(formatted_number(10_000)).to eq('10,000') }
      it{ expect(formatted_number(100_000)).to eq('100,000') }
    end

    context 'two commas output' do
      it{ expect(formatted_number(1_000_000)).to eq('1,000,000') }
      it{ expect(formatted_number(999_999_999)).to eq('999,999,999') }
    end

    context 'invalid range' do
      it{ expect{ described_class.new(-1).format }.to raise_error }
      it{ expect{described_class.new(999_999_999_999_999).format }.to raise_error }
    end
  end
end

def formatted_number(number)
  described_class.new(number).format
end
