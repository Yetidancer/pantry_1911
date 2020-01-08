class Pantry

  attr_reader :stock
  def initialize
    @stock = {}
  end

  def stock_check(ingredient)
    return 0 if @stock[ingredient] == nil
    @stock[ingredient]
  end

  def restock(ingredient, amount)
    if @stock[ingredient]
      @stock[ingredient] += amount
    else
    @stock[ingredient] = amount
    end
  end

  def ingredients_stocked
    @stock.keys
  end

  def enough_ingredients_for?(recipe)
    enough = true
    recipe.ingredients.each do |ingredient|
      if !ingredients_stocked.include?(ingredient)
        enough = false
      elsif @stock[ingredient] < recipe.ingredients_required[ingredient]
        enough = false
      end
    end
    enough
  end
end
