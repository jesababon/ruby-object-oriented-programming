class Panda
  attr_accessor :name, :sleep_hours

  def initialize(name, sleep_hours, is_fluffy = true)
    @name = name
    @sleep_hours = sleep_hours
    @is_fluffy = is_fluffy
  end

  # this is a "getter"
  # def name 
  #   @name
  # end

  # this is a setter
  # def name= new_name  
  #   @name = new_name
  # end

  def make_noise
    return "ACHOOOO, my private inner thoughts are #{secret_inner_thoughts}"
    "MEEP"
  end

  private
  def secret_inner_thoughts
    "i like deviled eggs better than bamboo"
  end
end

class GiantPanda < Panda
  def initialize(name, sleep_hours, is_fluffy, height)
    @height = height
    super name, sleep_hours, is_fluffy
  end

  def height_check
    "i am super tall panda at #{@height}meters"
  end
end

randall  = GiantPanda.new('Randall', 20, true, 10)

randall.name = "Randle"
p randall.name
p randall.make_noise

