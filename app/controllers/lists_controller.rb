class ListsController < ApplicationController
  before_action :set_board
  before_action :set_list, only: [:show, :edit, :update, :destroy]

  def index
    @lists = @board.lists
  end

  def show
  end

  def new
    @list = @board.lists.new
    render :form
  end

  def edit
    render :form
  end

  def create
    @list = @board.lists.new(list_params)

    if @list.save
      redirect_to [@board, @list]
    else
      # binding.pry
      render :form
    end
  end

  def update
    if @list.update(list_params)
      redirect_to [@board, @list]
    else
      render :form
    end
  end

  def destroy
    @list.destroy
    redirect_to [@board]
  end

  private 

  def set_board
    @board = Board.find(params[:board_id])
  end

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:title, :priority)
  end

end
