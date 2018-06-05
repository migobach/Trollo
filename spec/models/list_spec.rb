require 'rails_helper'

RSpec.describe List, type: :model do
  # let(:title) { FactoryBot.create(:title) }
  # let(:priority) { FactoryBot.create(:priority) }
  # let(:board_id) { FactoryBot.create(:board_it)}
  
  describe 'attributes' do [
    :title, 
    :priority
  ].each { |attr| it { should respond_to attr} }
  end

  describe 'validations' do 
    it { should validate_presence_of(:title) }
  end

  describe 'methods' do
    before(:each) do 
      @board = Board.create(title: 'note', priority: 1, color: 'green', first_name:'me', last_name: 'last')

      @list1 = List.create(title: 'Atitle', priority: 4, board_id: @board.id)
      @list2 = List.create(title: 'Btitle', priority: 40, board_id: @board.id)
      @list3 = List.create(title: 'Ctitle', priority: 10, board_id: @board.id)
      @list4 = List.create(title: 'Dtitle', priority: 100, board_id: @board.id)
    
    end

    it 'orders by title asc' do
      @lists = List.by_title
      # binding.pry
      expect(@lists).to eq([@list1, @list2, @list3, @list4])
    end

    it 'orders by title desc' do 
      @lists = List.by_title(:desc)
      expect(@lists).to eq([@list4, @list3, @list2, @list1])
    end

    it 'orders by priority asc' do
      @lists = List.by_priority
      expect(@lists).to eq([@list1, @list3, @list2, @list4])
    end

    it 'orders by priority desc' do 
      @lists = List.by_priority(:desc)
      expect(@lists).to eq([@list4, @list2, @list3, @list1])
    end
  end
end



