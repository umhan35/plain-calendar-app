# Calender and Event class

require './Event.rb'

class Calender

  SEPERATOR = ':'
  EVENT_SEPERATOR = ';'

  def initialize line
    @rawLine = line

    tokens = line.split SEPERATOR
    @userName = tokens[0]
    @events = parse tokens[1]
  end

  def belongsTo? userName
    return @userName == userName
  end

  def addEvent(name, desc, date)
    @events << Event.new(name, desc, date)
    @events.sort!.reverse!
  end
  
  def removeEvent eventName
    for event in @events
      @events.delete(event) if event.name? eventName
    end
  end

  def to_s
    @userName + SEPERATOR + events_to_s
  end

  def toJSON
    r = '['
    @events.each_with_index do |event, i|
      r += event.toJSON
      r += ',' if (i+1) != @events.length #no comma after last element
    end
    r += ']';
  end

  private
  def events_to_s
    result = "";

    @events.each do |e|
      result << e.to_s << EVENT_SEPERATOR
    end

    result
  end

  def parse line
    events = Array.new

    line.split(EVENT_SEPERATOR).each do |eventLine|
      events <<  Event.new(eventLine)
    end

    events.sort
  end
end
