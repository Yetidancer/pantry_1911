require 'minitest/autorun'
require 'minitest/pride'
require './lib/ingredient'
require './lib/recipe'

class RecipeTest < Minitest::Test

  def setup
    @recipe = Recipe.new("Mac and Cheese")
    @ingredient1 = Ingredient.new("Cheese", "C", 100)
    @ingredient2 = Ingredient.new("Macaroni", "oz", 30)

  end

  def test_it_exists
    assert_instance_of Recipe, @recipe
  end

  def test_it_has_attributes
    assert_equal "Mac and Cheese", @recipe.name
  end

  def test_ingredients_required_starts_as_an_empty_hash
    assert_equal ({}), @recipe.ingredients_required
  end

  def test_add_ingredient_works
    @recipe.add_ingredient(@ingredient1, 2)
    @recipe.add_ingredient(@ingredient2, 8)

    assert_equal 2, @recipe.ingredients_required.length
  end

  def test_it_can_retrieve_amount_of_ingredient_required
    @recipe.add_ingredient(@ingredient1, 2)
    @recipe.add_ingredient(@ingredient2, 8)

    assert_equal 2, @recipe.amount_required(@ingredient1)
    assert_equal 8, @recipe.amount_required(@ingredient2)
  end

  def test_it_can_retrieve_just_ingredients
    @recipe.add_ingredient(@ingredient1, 2)
    @recipe.add_ingredient(@ingredient2, 8)

    assert_equal Array, @recipe.ingredients.class
  end

  def test_it_can_calculate_total_calories
    @recipe.add_ingredient(@ingredient1, 2)
    @recipe.add_ingredient(@ingredient2, 8)

    assert_equal 440, @recipe.total_calories
  end

  def test_it_can_breakdown_ingredients_for_summary
    @recipe.add_ingredient(@ingredient1, 2)
    @recipe.add_ingredient(@ingredient2, 8)


    list = [{:ingredient=>"Macaroni", :amount=>"8 oz"}, {:ingredient=>"Cheese", :amount=>"2 C"}]

    assert_equal list, @recipe.ingredient_breakdown
  end
end
