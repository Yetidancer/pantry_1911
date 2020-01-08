require_relative 'summary'

class CookBook

  attr_reader :recipes
  def initialize
    @recipes = []
  end

  def add_recipe(recipe)
    @recipes << recipe
  end

  def summary
    @recipes.reduce([]) do |acc, recipe|
      sum = Summary.new(recipe)
      acc << sum.info
      acc
    end
  end
end
