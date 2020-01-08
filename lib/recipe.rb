class Recipe

  attr_reader :name, :ingredients_required
  def initialize(name)
    @name = name
    @ingredients_required = {}
  end

  def add_ingredient(ingredient, amount)
    @ingredients_required[ingredient] = amount
  end

  def ingredient_breakdown
    breakdown = ingredients.sort_by do |ingredient|
      (ingredient.calories * @ingredients_required[ingredient])
    end.reverse

    breakdown.reduce([]) do |acc, food|
      acc << {ingredient: food.name, amount: "#{@ingredients_required[food]}" + " #{food.unit}"}
      acc
    end
  end

  def amount_required(ingredient)
    @ingredients_required[ingredient]
  end

  def ingredients
    @ingredients_required.keys
  end

  def calorie_count(ingredient)
    (ingredient.calories * @ingredients_required[ingredient])
  end

  def total_calories
    ingredients.reduce(0) do |acc, ingredient|
      acc = acc + calorie_count(ingredient)
      acc
    end
  end


end
