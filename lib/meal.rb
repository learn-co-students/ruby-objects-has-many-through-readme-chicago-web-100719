class Meal
  attr_reader :waiter, :customer, :total, :tip

  @@all = []

  def initialize(waiter, customer, total, tip)
    @waiter = waiter
    @customer = customer
    @total = total
    @tip = tip
    @@all << self
  end

  def self.all
    @@all
  end

  def meals
    Meals.all.select do |meal|
      meal.customer == self
    end
  end

end
