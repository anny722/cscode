class SolutionsController < ApplicationController
  before_action :find_question, only: %i[create]
  def create
    @solution = Solution.new(solution_params)
    @solution.question = @question
    @solution.order = next_order
    params_tab_present
    @comment = Comment.new
    @output = Output.new
    if @solution.save
      redirect_to question_path(@question)
    else
      render 'questions/show'
    end
  end

  def destroy
    @solution = Solution.find(params[:id])
    @solution.destroy
    redirect_to question_path(@solution.question)
  end

  def params_tab_present
    @tab = Tab.find(params[:solution][:tab]) if params[:solution][:tab].present?
    @solution.tab = @tab if params[:solution][:tab].present?
  end

  def next_order
    orders = []
    max_comment = Comment.where(question: @question) == [] ? 0 : Comment.where(question: @question).maximum('order')
    max_solution = Solution.where(question: @question) == [] ? 0 : Solution.where(question: @question).maximum('order')
    max_output = Output.where(question: @question) == [] ? 0 : Output.where(question: @question).maximum('order')
    orders.push(max_comment)
    orders.push(max_solution)
    orders.push(max_output)
    orders == [0, 0, 0] ? 1 : orders.max + 1
  end

  private

  def find_question
    @question = Question.find(params[:question_id])
  end

  def solution_params
    params.require(:solution).permit(:solution)
  end
end
