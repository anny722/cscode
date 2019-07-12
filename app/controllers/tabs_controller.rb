class TabsController < ApplicationController
  def create
    @tab = Tab.new(tab_params)
    @question = Question.find(params[:question_id])
    @tab.question = @question
    if @tab.save
      redirect_to question_path(@question)
    else
      render 'questions/show'
    end
  end

  private

  def tab_params
    params.require(:tab).permit(:name)
  end
end
