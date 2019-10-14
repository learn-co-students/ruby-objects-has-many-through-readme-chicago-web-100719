class Waiter
    attr_reader :name, :experience
    
        @@all = []
    
        def initialize(name, experience)
            @name = name
            @experience = experience
            @@all << self
        end
    
        def self.all
            @@all
        end
    
        def new_meal(customer, total, tip)
            Meal.new(self, customer, total, tip)
        end
    
        def meals
            Meal.all.select {
                |meal| meal.waiter == self
            }
        end
    
        def best_tipper
            big_tip = meals[0]
            meals.each {
                |meal| if meal.tip > big_tip.tip
                big_tip = meal
                end
            }
            return big_tip.customer
        end
    end