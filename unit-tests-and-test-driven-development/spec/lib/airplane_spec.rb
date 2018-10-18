require_relative "../../lib/airplane"

describe Airplane do
  describe '#flying?' do
    context 'when the plane is flying' do
      it 'returns true' do
        expect(Airplane.new('flying').flying?).to eq true
      end
    end

    context 'when the plane is not flying' do
      it 'returns false' do
        expect(Airplane.new('grounded').flying?).to eq false
      end
    end
  end
end
