module RecipesHelper
  def recipe_params
    params.require(:recipe).permit(:title, :directions, :ingredients, :time)
  end
end
