
require_relative '../gf'


describe Girlfriend do
    
    describe '#pissed?' do
        context 'when I say something stupid' do
            it 'returns true' do
                expect(Girlfriend.new('pissed').pissed?).to eq true

               end
        end

        context 'when I dont say something stupid' do
            it 'returns false' do
                expect(Girlfriend.new('happy').pissed?).to eq false
            end
        end
    end
end
