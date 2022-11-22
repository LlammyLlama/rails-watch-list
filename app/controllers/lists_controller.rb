class ListsController < ApplicationController
  before_action :set_lists, only: %i[show edit update destroy]

  def index
    @lists = List.all
  end

  def show; end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to root_path(@list)
    else
      render :new, :unprocessable_entity
    end
  end

  private

  def set_lists
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name)
  end
end
