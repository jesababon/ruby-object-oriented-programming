class Pokemon
    attr_accessor :size, :weight_class, :habitat
    def initialize(size, weight_class, habitat)
    @size = size
    @weight_class = weight_class
    @habitat = habitat
    end
    def speak (sound = "rawr")
        sound
    end
end

squirtle = Pokemon.new("small", "light", "water")

p squirtle.speak("squirtle squirt")

class BaddyPokemon < Pokemon
    attr_accessor :primary_attack
    def initialize(size, weight_class, habitat, primary_attack="punch")
    @primary_attack = primary_attack
    super size, weight_class, habitat
    end
end

p squirtle = BaddyPokemon.new("small", "light", "water")
p squirtle = BaddyPokemon.new("small", "light", "water", "watergun")