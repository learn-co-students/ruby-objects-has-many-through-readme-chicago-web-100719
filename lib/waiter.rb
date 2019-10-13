class Waiter
  attr_reader :name
  attr_accessor :years_of_experience
  @@all = []

  def initialize(name, years_of_experience)
    @name = name
    @years_of_experience = years_of_experience
    @@all << self
  end

  def self.all
    @@all
  end

  def new_meal(customer, total, tip)
    Meal.new(self, customer, total, tip)
  end

  def meals
    Meal.all.select { |meal| meal.waiter == self }
  end

  def best_tipper
    arr = meals.map { |meal| meal.tip }
    meals.each { |meal| return meal.customer if meal.tip == arr.max }
  end

end