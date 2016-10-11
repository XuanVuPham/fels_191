class Admin::CategoriesController < ApplicationController
  before_action :logged_in_user
  before_action :verify_admin
  before_action :load_category, only: [:destroy, :update, :edit]

  def index
    @categories = Category.newest.paginate page: params[:page],
      per_page: Settings.per_page
  end

  def destroy
    if @category.destroy
      flash[:success] = t "delete_successfully"
    else
      flash[:danger] = t "delete_not_successfully"
    end
    redirect_to admin_categories_path
  end

  def edit
  end

  def update
    if @category.update_attributes category_params
      flash[:success] = t "update_category_successfully"
    else
      flash[:danger] = t "update_category_not_successfully"
    end
    redirect_to admin_categories_path
  end

  private
  def category_params
    params.require(:category).permit :title, :question_number
  end

  def load_category
    @category = Category.find_by id: params[:id]
    unless @category
      flash[:danger] = t "category_not_exist"
      redirect_to admin_categories_path
    end
  end
end
