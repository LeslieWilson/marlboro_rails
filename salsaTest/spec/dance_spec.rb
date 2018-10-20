require_relative '../dance'

describe Card do
    describe 'facecheck' do
        context 'checks to see if the card drawn is a face card' do
            it 'returns true' do
            expect(Card.new('club', 'jack').facecheck).to eq true
            end

            it 'returns false if not a face card' do
            expect(Card.new(10, 'sandy').facecheck).to eq false
            end
        end
    end
end



# RSpec.describe Euler_1 do
#   let(:example) {Euler_1.new(10)}
#
#   describe ".new" do
#     it "takes a number as an argument" do
#       expect(example).to be_a(Euler_1)
#     end
#   end



describe Card do
    let(:blah) {Card.new('club', 'king')}

    describe '.new' do
        it 'takes two arguments as arguments' do
            expect(blah).to be_a(Card)
        end
    end

    describe 'club?' do
    it 'will be a suit that is a club' do
    expect(blah.suit).to eq('club')

        end
    end

    describe 'facecheck?' do
        it 'will be a facecard' do
            expect(blah.suit).to be_a('club')
        end
    end
end
