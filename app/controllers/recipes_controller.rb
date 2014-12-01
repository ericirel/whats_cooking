class RecipesController < ApplicationController

  def index
    @recipes = Recipe.paginate(:page => params[:page] || 1, :per_page => params[:per_page] || 3)
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
      @recipe.save
      flash[:notice] = "Recipe posted"
      redirect_to recipe_path(@recipe)
    else
      flash[:alert] = "Something went wrong"
  end

  def edit
  end

  def update
    if @recipe.update(recipe_params)
      flash[:notice] = "Recipe updated"
      redirect_to :back
    else
      flash[:alert] = "Something went wrong"
    end
  end

  def destroy
    if current_user.id = @recipe.user.id
      @recipe.destroy
      flash[:notice] = "Recipe deleted"
    else
      flash[:alert] = "Something went wrong"
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :ingredients, :directions, :time)
  end
end

