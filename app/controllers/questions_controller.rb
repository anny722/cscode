class QuestionsController < ApplicationController
  before_action :find_question, only: [:show]

  def show
  end

  def create
    @theme = Theme.find(params[:theme_id])
    @question = Question.new(question_params)
    @question.theme = @theme
    if @question.save
      redirect_to theme_path(@theme)
    else
      render 'themes/show'
    end
  end

  private

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:subject)
  end
end
