require 'rails_helper'

RSpec.describe Board, type: :model do
  
  describe 'attributes' do [
    :title, 
    :priority
  ].each { |attr| it { should respond_to attr } }
  end

  describe 'validations' do
    it { should validate_presence_of (:title) }
  end

  describe 'methods' do
    before(:each) do
      @board1 = Board.create(title: 'Aboard', priority: 1, color: 'yellow', first_name: 'Sarah', last_name: 'Bach')
      @board2 = Board.create(title: 'Bboard', priority: 2, color: 'red', first_name: 'Michael', last_name: 'Anderson')
      @board3 = Board.create(title: 'Dboard', priority: 3, color: 'orange', first_name: 'Lori', last_name: 'Tomasetti')
      @board4 = Board.create(title: 'Cboard', priority: 4, color: 'purple', first_name: 'Curt', last_name: 'Bahr')
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

    it 'orders by first_name asc' do
      @boards = Board.by_first_name 
      expect(@boards).to eq([@board4, @board3, @board2, @board1])
    end

    it 'orders by first_name desc' do
      @boards = Board.by_first_name(:desc)
      expect(@boards).to eq([@board1, @board2, @board3, @board4])
    end

    it 'orders by last_name asc' do
      @boards = Board.by_last_name
      expect(@boards).to eq([@board2, @board1, @board4, @board3])
    end

    it 'orders by last_name desc' do
      @boards = Board.by_last_name(:desc)
      expect(@boards).to eq([@board3, @board4, @board1, @board2])
    end

    it 'orders by color asc' do 
      @boards = Board.by_color
      expect(@boards).to eq([@board3, @board4, @board2, @board1])
    end

    it 'orders by color desc' do 
      @boards = Board.by_color(:desc)
      expect(@boards).to eq([@board1, @board2, @board4, @board3])
    end
  end
end
