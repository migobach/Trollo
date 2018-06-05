require 'rails_helper'

RSpec.describe ListsController, type: :controller do


  describe "GET #index" do
    it "returns http success" do
      list = FactoryBot.create(:list)
      get :index, params: { board_id: list.board_id }
      expect(response).to be_successful
    end
  end

  # describe "GET #show" do
  #   it "returns http success" do
  #     list = List.create! valid_attributes
  #     expect(response).to be_successful
  #   end
  # end

  # describe "GET #new" do
  #   it "returns http success" do
  #     get :new
  #     expect(response).to be_successful
  #   end
  # end

  # describe "GET #edit" do
  #   it "returns http success" do
  #     list = List.create! valid_attributes
  #     get :edit, params: { id: board_id, id: list.id }
  #     expect(response).to be successful
  #   end
  # end

  # describe "POST #create" do 
  #   context "with valid params" do
  #     it "creates a new list" do 
  #       expect {

  #       }
  #   end
  # end
end
