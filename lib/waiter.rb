class Waiter

    attr_reader :name
    attr_writer :years_expirience

    @@all = []

    def initialize(name, years_expirience)
        @name = name
        @years_expirience = years_expirience
        @@all << self 
    end

    def self.all
        @@all
    end

    def new_meal(customer, total, tip = 0)
        Meal.new(self, customer, total, tip)
    end

    def meals
        Meal.all.select do |meal|
            meal.waiter == self 
        end
    end

    def best_tipper
        best_tipped_meal = meals.max do |a, b|
        a.tip <=> b.tip
    end
    best_tipped_meal.customer
    end


end