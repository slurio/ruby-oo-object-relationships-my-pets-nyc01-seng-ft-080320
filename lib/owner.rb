class Owner
  attr_reader :name, :species

  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def say_species
    "I am a human."
  end

  def self.all
    @@all
  end

  def self.count
    self.all.count
  end

  def self.reset_all
    self.all.clear
  end

  def cats
    Cat.all.select do |cat|
      cat.owner == self
    end
  end

  def dogs
    Dog.all.select do |dog|
      dog.owner == self
    end
  end

  def buy_cat(cat_name)
    Cat.new(cat_name, self)
  end

  def buy_dog(dog_name)
    Dog.new(dog_name, self)
  end

  def walk_dogs
    dogs.collect do |dog|
      dog.mood = "happy"
    end
  end

  def feed_cats
    cats.collect do |cat|
      cat.mood = "happy"
    end
  end

  def sell_pets
    pet_array = []
    pet_array.concat(cats, dogs)
    pet_array.collect do |pet|
      pet.owner = nil
      pet.mood = "nervous"
    end
  end

  def list_pets
  "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

end