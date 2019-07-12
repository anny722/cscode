class QuestionsController < ApplicationController
  before_action :find_question, only: [:show]
  def show
    @tab = Tab.new
    @comment = Comment.new
    @solution = Solution.new
    @output = Output.new
    @all_solution = all_solution
    @first_tab_id = first_tab_id
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

  # find all comments solutions and outputs for a question and sort by order
  def all_solution
    all_solution = []
    comments = Comment.where(question: @question)
    solutions = Solution.where(question: @question)
    outputs = Output.where(question: @question)
    push_elements_in_array(all_solution, comments)
    push_elements_in_array(all_solution, solutions)
    push_elements_in_array(all_solution, outputs)
    all_solution.sort_by(&:order)
  end

  def push_elements_in_array(array, elements)
    elements.each do |element|
      array.push(element)
    end
  end

  def first_tab_id
    Tab.where(question: @question).minimum('id') unless @question.tabs == []
  end

  def filter_solution_by_tab(tab)
    @all_solution.filter do |solution|
      solution.tab == tab
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
