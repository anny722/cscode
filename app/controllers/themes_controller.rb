class ThemesController < ApplicationController
  before_action :find_theme, only: [:show, :destroy]
  def show
    @question = Question.new
    @questions = Question.all
  end

  def create
    @category = Category.find(params[:category_id])
    @theme = Theme.new(theme_params)
    @theme.category = @category
    if @theme.save
      redirect_to category_path(@category)
    else
      render 'categories/show'
    end
  end

  def destroy
    @theme.destroy
    redirect_to category_path(@theme.category)
  end

  private

  def find_theme
    @theme = Theme.find(params[:id])
  end

  def theme_params
    params.require(:theme).permit(:name)
  end
end
