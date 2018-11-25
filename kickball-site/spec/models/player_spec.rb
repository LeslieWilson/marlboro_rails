require "spec_helper"

RSpec.describe Player do
  let(:player_name) { 'Count Chocula' }
  let(:position) { 'Pitcher' }
  let(:player) { Player.new(player_name, position) }

  it 'has a name'
  it 'has a position'
end
