require 'minitest/autorun'
require 'minitest/pride'
require './lib/ingredient'
require './lib/recipe'
require './lib/pantry'
require './lib/cook_book'

class CookBookTest < Minitest::Test

  def setup
    @ingredient1 = Ingredient.new("Cheese", "C", 100)
    @ingredient2 = Ingredient.new("Macaroni", "oz", 30)
    @ingredient3 = Ingredient.new("Ground Beef", "oz", 100)
    @ingredient4 = Ingredient.new("Bun", "g", 1)
    @recipe1 = Recipe.new("Mac and Cheese")
    @recipe2 = Recipe.new("Burger")
    @pantry = Pantry.new
    @cookbook = CookBook.new
  end

  def test_it_exists
    assert_instance_of CookBook, @cookbook
  end

  def test_it_can_provide_summary
    @recipe1.add_ingredient(@ingredient1, 2)
    @recipe1.add_ingredient(@ingredient2, 8)
    @recipe2.add_ingredient(@ingredient3, 4)
    @recipe2.add_ingredient(@ingredient4, 100)

    @cookbook.add_recipe(@recipe1)
    @cookbook.add_recipe(@recipe2)

    assert_equal 2, @cookbook.recipes.length

    answer = [
      {:name=>"Mac and Cheese",
        :details=>
        {
          :ingredients=>
            [
              {:ingredient=>"Macaroni", :amount=>"8 oz"},
              {:ingredient=>"Cheese", :amount=>"2 C"}
            ],
          :total_calories=>440
        }
      },
      {:name=>"Burger",
        :details=>
          {
            :ingredients=>
              [
                {:ingredient=>"Ground Beef", :amount=>"4 oz"}, {:ingredient=>"Bun", :amount=>"100 g"}
              ],
          :total_calories=>500
        }
      }
    ]

    assert_equal answer, @cookbook.summary
  end
end
