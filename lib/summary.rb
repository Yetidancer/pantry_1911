class Summary

  attr_reader :name, :details
  def initialize(recipe)
    @name = recipe.name
    @details = {ingredients: recipe.ingredient_breakdown, total_calories: recipe.total_calories}
  end

  def info
    {name: @name, details: @details}
  end
end
