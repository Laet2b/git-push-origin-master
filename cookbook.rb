require 'csv'
require_relative 'recipe'

class Cookbook
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @recipes = []
    csv_options = { col_sep: ',' }
    CSV.foreach(csv_file_path, csv_options) do |row|
      @recipes << Recipe.new(row[0], row[1], row[2], row[3], row[4])
    end
  end

  def all
    @recipes
  end

  def add_recipe(recipe)
    @recipes << recipe
    save_to_cvs
  end

  def remove_recipe(recipe_index)
    @recipes.delete_at(recipe_index)
    save_to_cvs
  end

  def save_to_cvs
    csv_options = { col_sep: ',' }
    CSV.open(@csv_file_path, 'wb', csv_options) do |csv|
      @recipes.each do |element|
        csv << [element.name, element.description, element.prep_time]
      end
    end
  end

end
