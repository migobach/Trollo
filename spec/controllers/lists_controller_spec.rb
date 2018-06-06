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
    it "creates a new list" do 
      list = FactoryBot.create(:list)
      expect {
        post :create, params: { board_id: list.board_id , list: { title: 'list item', priority: 1 } }
      }.to change(List, :count).by(1)
    end

    # it "redirects to the board" do
    #   list = FactoryBot.create(:list)
    #   post :create, params: { board_id: list.board_id, list: { title: 'List Name', priority: 1 } }
    #   expect(response).to redirect_to(board_path(list.board_id))
    # end
  end

  #add context with invalid params

  describe "PUT #update" do

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

