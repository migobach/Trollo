require 'rails_helper'

RSpec.describe ListsController, type: :controller do


  describe "GET #index" do
    it "returns http success" do
      list = FactoryBot.create(:list)
      get :index, params: { board_id: list.board_id }
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns http success" do
      list = FactoryBot.create(:list)
      get :show, params: { board_id: list.board_id, id: list.id }
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns http success" do
      list = FactoryBot.create(:list)
      get :new, params: { board_id: list.board_id }
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      list = FactoryBot.create(:list)
      get :edit, params: { board_id: list.board_id, id: list.id }
      expect(response).to be_successful
    end
  end

  describe "POST #create" do 
    context "with valid params" do
      it "creates a new list" do 
        list = FactoryBot.create(:list)
        expect {
          post :create, params: { board_id: list.board_id , list: { title: 'list item', priority: 1 } }
        }.to change(List, :count).by(1)
      end

      it "redirects to the board" do
        board = FactoryBot.create(:board)
        post :create, params: { board_id: board.id, list: { title: 'List Name', priority: 1 } }
        expect(response).to redirect_to(board_list_path(board.id, List.all.last))
      end
    end

    context "with invalid params" do
      it "does not create a new list" do
        list = FactoryBot.create(:list)
        expect {
          post :create, params: { board_id: list.board_id, list: { title: '', priority: 1 } }
        }.to change(List, :count).by(0)
      end 

      it "returns a success (display a new template)" do
        list = FactoryBot.create(:list)
        post :create, params: { board_id: list.board_id, list: { title: '', priority: 1 } }
        expect(response).to be_successful
      end
    end 

  end

  describe "PUT #update" do
    context "with valid params" do
      it "updates the title value" do
        list = FactoryBot.create(:list)
        put :update, params: {board_id: list.board_id, id: list.id, list: { title: 'Updated Name' } }
        list.reload
        expect(list.title).to eq('Updated Name')
      end

      it "redirects to the edited list" do 
        list = FactoryBot.create(:list)
        put :update, params: { board_id: list.board_id, id: list.id, list: { title: 'Updated', priority: 2} }
        list.reload
        expect(list.title).to redirect_to(board_list_path(list.board_id, list.id))
      end
    end
  end

    context "with invalid params" do 
      it "does not update the list" do 
        list = FactoryBot.create(:list)
        put :update, params: { board_id: list.board_id, id: list.id, list: { title: '', priority: 3} }
        list.reload
        expect(response).to be_successful
      end

      it "return a success (edit template)" do 
        list = FactoryBot.create(:list)
        put :update, params: { board_id: list.board_id, id: list.id, list: { title: '', priority: 6 } }
        list.reload
        expect(response).to be_successful 
      end
    end

  describe "DELETE #destroy" do
    it 'destroys the requested list' do 
      list = FactoryBot.create(:list)
      # binding.pry
      expect {
        delete :destroy, params: { id: list.id, board_id: list.board_id }
      }.to change(List, :count).by(-1)
    end

    it 'redirects to the board page' do
      list = FactoryBot.create(:list)
      delete :destroy, params: { id: list.id, board_id: list.board_id }
      expect(response).to redirect_to(board_path(list.board_id))
    end
  end

end

