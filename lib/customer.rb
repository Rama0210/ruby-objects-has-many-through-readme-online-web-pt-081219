class Customer
  attr_accessor :name, :age 
  @@all = []
  
  def initialize(name, age)
    @name = name
    @age = age
    @@all << self
  end
 
  def self.all
    @@all
  end
  
  def new_meal(waiter, total, tip=0)
    Meal.new(waiter, self, total, tip)
  end
  
  def meals
  Meal.all.select do |meal|
    meal.customer == self
  end
end
  
  def waiters
    Meal.all.select do |waiter|
      waiter.customer == self
    end
  end
  
  def waiters
  meals.map do |meal|
    meal.waiter
  end
end
  
  def best_tipper
  best_tipped_meal = meals.max do |meal_a, meal_b|
    meal_a.tip <=> meal_b.tip
  end
 
  best_tipped_meal.customer
end
  
  jason = Waiter.new("Jason", 4)
lisa = Customer.new("Lisa", 24)
tim = Customer.new("Tim", 35)
terrance = Customer.new("Terrance", 27)
 
terrance.new_meal(jason, 50, 3)
lisa.new_meal(jason, 40, 10)
tim.new_meal(jason, 45, 8)
 
jason.best_tipper #=> #<Customer:0x00007f80829959a8 @name="Lisa", @age=24>
jason.best_tipper.name #=> "Lisa"
  
end