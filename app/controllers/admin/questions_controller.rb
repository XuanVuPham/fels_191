class Admin::QuestionsController < ApplicationController
  before_action :load_question, only: [:destroy, :update, :edit]

  def index
    @questions = Question.newest.paginate page: params[:page],
      per_page: Settings.per_page
  end

  def edit
    @categories = Category.all
  end

  def destroy
    if @question.destroy
      flash[:success] = t "delete_successfully"
    else
      flash[:danger] = t "delete_not_successfully"
    end
    redirect_to admin_questions_path
  end

  def update
    if @question.update_attributes question_params
      flash[:success] = t "update_category_successfully"
    else
      flash[:danger] = t "update_category_not_successfully"
    end
    redirect_to admin_questions_path
  end

  def new
    @question = Question.new
    @categories = Category.all
  end

  def create
    @question = Question.new question_params
    if @question.save
      flash[:success] = t "saved"
    else
      flash[:danger] = t "save_not_success"
    end
    redirect_to new_admin_question_path
  end

  private
  def question_params
    params.require(:question).permit(
      :name, :category_id,
      answers_attributes: [:name, :is_correct]
    )
  end

  def load_question
    @question = Question.find_by id: params[:id]
    unless @question
      flash[:danger] = t "question_not_exist"
      redirect_to admin_questions_path
    end
  end
end
