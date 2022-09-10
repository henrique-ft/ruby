class Zombie
  attr_accessor :name, :brains, :alive, :rotting

  def initialize
    @name = 'ash'
    @brains = 0
    #@alive = false
    #@rotting = true
  end

  def hungry?
    true
  end
end
