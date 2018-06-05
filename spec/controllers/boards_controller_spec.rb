require 'rails_helper'

RSpec.describe BoardsController, type: :controller do

  let(:valid_attributes) {
    { title: 'Test Board', priority: 3, color: 'Green', first_name: 'Me', last_name: 'Meson' }
  }

  let(:invalid_attributes) {
    { title: '', priority: 4, color: 'Yellow', first_name: 'Me', last_name: 'Meson'}
  }

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns http success" do
      board = Board.create! valid_attributes
      get :show, params: { id: board.id }
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      board = Board.create! valid_attributes
      get :edit, params: { id: board.id }
      expect(response).to be_successful
    end
  end

  describe "POST #create" do 
    context "with valid params" do
      it "create a new board" do 
        expect {
          post :create, params: { board: valid_attributes }
        }.to change(Board, :count).by(1)
      end

      it "redirects to the created board" do
        post :create, params: { board: valid_attributes }
        expect(response).to redirect_to(root_path)
      end
    end

    context "with invalid params" do 
      it "does not create a new board" do
        expect {
          post :create, params: { board: invalid_attributes }
      }.to change(Board, :count).by(0)
      end 

      it "returns a success (display new template)" do
        post :create, params: { board: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PUT #update" do 
    let(:new_attributes) {
      { priority: 5 }
    }

    context "with valid params" do 
      it "updates the priority value" do
        board = Board.create! valid_attributes
        put :update, params: { id: board.id, board: new_attributes }
        board.reload
        expect(board.priority).to eq(new_attributes[:priority])
      end

      it "redirect to the board" do 
        board = Board.create! valid_attributes
        put :update, params: { id: board.id, board: new_attributes }
        board.reload
        expect(response).to redirect_to(board)
      end
    end

    context "with invalid params" do
      it 'does not update the board' do 
        board = Board.create! valid_attributes
        put :update, params: { id: board.id, board: invalid_attributes }
        board.reload 
        expect(board.priority).to_not eq(invalid_attributes[:priority])
      end

      it 'return a success (edit template)' do 
        board = Board.create! valid_attributes
        put :update, params: { id: board.id, board: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end 

  describe "DELETE #destroy" do
    it 'destroys the requested board' do 
      board = Board.create! valid_attributes
      expect {
        delete :destroy, params: { id: board.id } 
      }.to change(Board, :count).by(-1)
    end

    it 'redirects to the board index' do
      board = Board.create! valid_attributes
      delete :destroy, params: { id: board.id }
      expect(response).to redirect_to(root_path)
    end
  end
end
