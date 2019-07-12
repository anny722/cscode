class ThemesController < ApplicationController
  before_action :find_theme, only: [:show]
  def show
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

  private

  def find_theme
    @theme = Theme.find(params[:id])
  end

  def theme_params
    params.require(:theme).permit(:name)
  end
end
