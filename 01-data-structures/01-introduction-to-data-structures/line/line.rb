# A line of people at an amusement park ride
# There is a front to the line, as well as a back.
# People may leave the line whenever they see fit and those behind them take their place.
class Line
  attr_reader :members

  def initialize
    @members = []
  end

  def join(person)
    if !@members.include?(person)
      @members << person;
    else
      p "That person is already in line. You need to pick a different name to put a new person in line."
    end

  end

  def leave(person)
    if @members.include?(person)
      @members.delete(person)
    else 
      p "You are trying to remove someone who isn't in the line."
    end
  end

  def front
    if @members.length > 0
      @members[0]
    else
      p "There isn't anyone in line!"
    end
  end

  def middle
    if @members.length > 2
      @members[@members.length/2+@members.length%2]
    else 
      p "There are 2 or less people in line, so there isn't really a middle person. Use front or back to access the front of back of this line"
    end
  end

  def back
    if @members.length > 0
      @members[-1]
    else
      p "There is no one in line, so you can't really have a back of the line"
    end
  end

  def search(person)
    if index(person)
      @members[index(person)]
    end
  end

  private

  def index(person)
    @members.index(person)
  end

end