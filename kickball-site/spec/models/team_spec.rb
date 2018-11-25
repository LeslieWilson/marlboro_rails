require "spec_helper"

RSpec.describe Team do
  let(:players) do
    [
      Player.new('Count Chocula', 'Pitcher'),
      Player.new('Trix the Rabbit', 'Catcher'),
      Player.new('Capn Crunch', '1st Base')
    ]
  end

  let(:team) { Team.new('Cereal Superstars', players)}

  it 'has a name' do
  end

  it 'has a list of players' do
  end
end
