class CategoriesController < ApplicationController
  before_action :find_category, only: [:show, :destroy]

  def index
    @category = Category.new
    @categories = Category.where(user: current_user)
  end

  def create
    @category = Category.new(category_params)
    @category.user = current_user
    if @category.save
      redirect_to root_path
    else
      render 'categories/index'
    end
  end

  def show
    @theme = Theme.new
    @question = Question.new
    @themes = Theme.where(category: @category)
  end

  def destroy
    @category.destroy
    redirect_to root_path
  end

  private

  def find_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
