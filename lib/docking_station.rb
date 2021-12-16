require_relative 'bike'

class DockingStation 
  attr_reader :bike
  DEFAULT_CAPACITY = 20

  def initialize
    @bike = [] 
  end

  def release_bike
    # "fail" is a guard condition, catches errors as a first priorty
    # stop code from running more 
    fail 'No bikes available' if empty?
    @bike.pop
  end

  def dock (bikes)
    fail 'Docking station full' if full?
    @bike << bikes
  end

  private

  def full?
    @bike.count >= DEFAULT_CAPACITY
  end

  def empty?
    @bike.empty?
  end

end