require 'rails_helper'

RSpec.describe Board, type: :model do
  
end


let(:robot) { FactoryBot.create(:robot) }
let(:evil_robot) { FactoryBot.create(:robot, friendly: false) }

describe 'abilities' do 

  it 'greets humans if friendly' do
    expect(robot.greet).to equl('Hello Human')
  end

  it 'attacks humans if not frieldy' do
    expect(evil_robot.attack).to eq(true)
  end
end
end