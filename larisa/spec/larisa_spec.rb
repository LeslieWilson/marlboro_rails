require_relative '../larisa'

describe Larisa do
    describe '#plan?' do
        context 'when larisa is making plans' do
            it 'returns true' do
            expect(Larisa.new('travel').plan?).to eq true
        end
    end

    context 'when larisa makes no plans' do
        it 'returns false' do
        expect(Larisa.new('stay home').plan?).to eq false
    end
end
end
end
