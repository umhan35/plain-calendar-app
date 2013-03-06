require './Calender.rb'

class AppReadOnly

  attr_reader :fileName

  def initialize(fileName = '../data/data.txt')
    @fileName = fileName

    @calenderLineNum = 0
    @calender
  end

  def getUserNames
    userNames = Array.new
    lines do |line, lineNum|
      tokens = line.split(':')
      userNames << tokens[0]
    end
    userNames
  end
  
  def getCalender userName
    lines do |line, lineNum|
      c = Calender.new(line)
      if c.belongsTo? userName
        @calenderLineNum = lineNum
        @calender = c
        return c
      end
    end
  end

  def addEvent(userName, eventName, eventDesc, eventDate)
    c = getCalender(userName)
    c.addEvent(eventName, eventDesc, eventDate)
  end
  
  def removeEvent(userName, event)
    c = getCalender(userName)
    c.removeEvent(event)
  end

  protected

  def calenderLineNum? lineNum
    @calenderLineNum == lineNum
  end

  def getCalenderFileFormat
    @calender.to_s
  end

  private

  def lines
    open(@fileName).each_with_index do |line, lineNum|
      line = line.chomp
      yield line, lineNum
    end
  end
end
