require 'rails_helper'

RSpec.describe Task, type: :model do
  
  describe 'attributes' do [
    :body, 
    :priority
  ].each { |attr| it { should respond_to attr} }
  end

  describe 'validations' do 
    it { should validate_presence_of(:body) }
  end

  describe 'methods' do
    before(:each) do
      @board = Board.create(title: 'note', priority: 1, color: 'green', first_name:'me', last_name: 'last')
      @list = List.create(title: 'List Title', priority: 1, board_id: @board.id)
      
      @task1 = Task.create(body: 'Abody', priority: 3, list_id: @list.id)
      # binding.pry
      @task2 = Task.create(body: 'Bbody', priority: 1, list_id: @list.id)
      @task3 = Task.create(body: 'Dbody', priority: 10, list_id: @list.id)
      @task4 = Task.create(body: 'Cbody', priority: 8, list_id: @list.id)
    end
    
    it 'orders by body asc' do 
      @tasks = Task.by_body
      expect(@tasks).to eq([@task1, @task2, @task4, @task3])
    end
    
    it 'orders by body desc' do 
      @tasks = Task.by_body(:desc)
      expect(@tasks).to eq([@task3, @task4, @task2, @task1])
    end
    
    it 'orders by priority asc' do 
      @tasks = Task.by_priority
      expect(@tasks).to eq([@task2, @task1, @task4, @task3])
    end
    
    it 'orders by priority desc' do 
      @tasks = Task.by_priority(:desc)
      expect(@tasks).to eq([@task3, @task4, @task1, @task2])
    end
  end
end