require 'rails_helper'

RSpec.describe Board, type: :model do
  let(:board) { FactoryBot.create(:board) }
  
  describe 'attributes' do [
    :title, 
    :priority
  ].each { |attr| it { should respond_to attr } }
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
  end

  describe 'methods' do
    before(:each) do
      @board1 = Board.create(title: 'Aboard', priority: 1)
      @board2 = Board.create(title: 'Bboard', priority: 2)
      @board3 = Board.create(title: 'Dboard', priority: 3)
      @board4 = Board.create(title: 'Cboard', priority: 4)
    end
  
    it 'orders by title' do
      @boards = Board.by_title
      expect(@boards).to eq([@board1, @board2, @board4, @board3])
    end

    it 'orders by priority asc' do 
      @boards = Board.by_priority
      expect(@boards).to eq([@board1, @board2, @board3, @board4])
    end

    it 'orders by prioritiy desc' do 
      @boards = Board.by_priority(:desc)
      expect(@boards).to eq([@board4, @board3, @board2, @board1])
    end
  end
end
