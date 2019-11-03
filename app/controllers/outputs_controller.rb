class OutputsController < ApplicationController
  before_action :find_question, only: %i[create]
  def create
    @output = Output.new(output_params)
    @output.question = @question
    @output.order = next_order
    params_tab_present
    @comment = Comment.new
    @solution = Solution.new
    if @output.save
      redirect_to question_path(@question)
    else
      render 'questions/show'
    end
  end

  def destroy
    @output = Output.find(params[:id])
    @output.destroy
    redirect_to question_path(@output.question)
  end

  def params_tab_present
    @tab = Tab.find(params[:output][:tab]) if params[:output][:tab].present?
    @output.tab = @tab if params[:output][:tab].present?
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

  def output_params
    params.require(:output).permit(:output)
  end
end
