require 'date'

class Event

  SEPERATOR = '`'

  attr_reader :date
  
  def initialize *args
    case args.size
    when 3
      init *args
    when 1
      initWithLine *args
    end
  end

  def init name, desc, date
    @name, @description = name, desc
    setDate date
  end

  def initWithLine line
    @name, @description, @date = "", "", ""
    parse line
  end

  def hash # used for Ary.uniq
    [@name, @description, @date].hash
  end
  
  def eql? eventB # used for Ary.uniq
#    p eventB
#    eventB.name == @name && @description == eventB.description && @date == eventB.date
    hash == eventB.hash
  end

  def <=>(eventB)
#    p eventB.class
    raise ArgumentError, 'must be a Event object' unless eventB.instance_of? Event
    return eventB.date <=> self.date
  end

  def name? eventName
    return @name = eventName
  end

  def to_s
    @name + SEPERATOR + @description + SEPERATOR + @date.to_s
  end

  def toJSON
    '{"name":"' + @name + '","desc":"' + @description + '","date":"' + @date.to_s + '"}';
  end

  
  private

  def parse line
    tokens = line.split SEPERATOR
    @name, @description = tokens[0], tokens[1]
    setDate tokens[2]
  end
  
  def setDate date
    @date = Date.parse date
  end
end




def test
  e = Event.new '30 a3 due`about js`2011-6-20'
  puts e
end

def testCompare
  e1 = Event.new '30 a3 due`about js`2011-1-21'
  e2 = Event.new '30 a3 due`about js`2011-6-22'
  e3 = Event.new '30 a3 due`about js`2011-5-22'

  a=Array.new
  a<<e1<<e2<<e3

  p e1.class
  p e2.class
  p e3.class

  p a
 a.sort!.reverse!
 p a
end

#testCompare
