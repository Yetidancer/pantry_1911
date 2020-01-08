require 'minitest/autorun'
require 'minitest/pride'
require './lib/ingredient'
require './lib/recipe'
require './lib/pantry'

class PantryTest < Minitest::Test

  def setup
    @recipe = Recipe.new("Mac and Cheese")
    @ingredient1 = Ingredient.new("Cheese", "C", 100)
    @ingredient2 = Ingredient.new("Macaroni", "oz", 30)
    @pantry = Pantry.new
  end

  def test_it_exists
    assert_instance_of Pantry, @pantry
  end

  def test_stock_begins_empty
    @recipe.add_ingredient(@ingredient1, 2)
    @recipe.add_ingredient(@ingredient2, 8)

    assert_equal ({}), @pantry.stock
  end

  def test_can_check_stock
    @recipe.add_ingredient(@ingredient1, 2)
    @recipe.add_ingredient(@ingredient2, 8)

    assert_equal 0, @pantry.stock_check(@ingredient1)
  end

  def test_can_stock_pantry
    @pantry.restock(@ingredient1, 5)
    @pantry.restock(@ingredient1, 10)

    assert_equal 15, @pantry.stock_check(@ingredient1)
  end

  def test_it_can_determine_if_pantry_has_ingredients_for_recipe
    @recipe.add_ingredient(@ingredient1, 2)
    @recipe.add_ingredient(@ingredient2, 8)
    @pantry.restock(@ingredient1, 5)
    @pantry.restock(@ingredient1, 10)

    refute @pantry.enough_ingredients_for?(@recipe)

    @pantry.restock(@ingredient2, 7)
    refute @pantry.enough_ingredients_for?(@recipe)

    @pantry.restock(@ingredient2, 1)
    assert @pantry.enough_ingredients_for?(@recipe)
  end
end
