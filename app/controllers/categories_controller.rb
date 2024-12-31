class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show edit update destroy]

  # GET /genres
  def index
    @categories = Category.all
  end

  # GET /genres/1
  def show
  end

  # GET /genres/new
  def new
    @category = Category.new
  end

  # POST /genres
  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to @category, notice: "Category was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # GET /genres/1/edit
  def edit
  end

  # PATCH/PUT /genres/1
  def update
    if @category.update(category_params)
      redirect_to @category, notice: "Category was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /genres/1
  def destroy
    @category.destroy
    redirect_to category_path, notice: "Category was successfully deleted."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_category
    @category = Category.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def category_params
    params.require(:category).permit(:name)
  end
end
