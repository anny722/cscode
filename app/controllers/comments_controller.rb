class CommentsController < ApplicationController
  before_action :find_question, only: %i[create]
  def create
    @comment = Comment.new(comment_params)
    @comment.question = @question
    @comment.order = next_order
    params_tab_present
    if @comment.save
      redirect_to question_path(@question)
    else
      render 'questions/show'
    end
  end

  def params_tab_present
    @tab = Tab.find(params[:comment][:tab]) if params[:comment][:tab].present?
    @comment.tab = @tab if params[:comment][:tab].present?
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

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
