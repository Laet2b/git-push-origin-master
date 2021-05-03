class Recipe
  attr_accessor :name, :description, :prep_time, :rating, :done

  def initialize(name, description, prep_time, rating = 0, done = false)
    @name = name
    @description = description
    @prep_time = prep_time
    @rating = rating
    @done = done
  end

end
