require './App.rb'

class AppApi

  DATA_FILE_NAME = '../data/data.txt'
  ACTIVE_USER_FILE_NAME = '../data/lastUser.txt'
  
  def initialize
    @app = App.new DATA_FILE_NAME
  end
  
  def putsCalenderJson(userName)
    c = @app.getCalender(userName)
    puts c.toJSON
  end

  def putsUsersJson
    a = @app.getUserNames
    puts strArrayToJson(a)
  end

  def addEvent(userName, eventName, eventDesc, eventDate)
    @app.addEvent(userName, eventName, eventDesc, eventDate);
  end

  def removeEvent(userName, line) # line like "2011-08-18: hahae (gosh~)"
    tokens = line.split(':')
    date = tokens[0]
    tokens = tokens[1].split('(')
    name = tokens[0].strip # got " hahae (gosh~)", then got "hahae"
    desc = tokens[1].split(')')[0]
    
    event = Event.new(name, desc, date)
    
    @app.removeEvent(userName, event)
  end

  def setLastActiveUser(userName)
    require 'tempfile'
    temp_file = Tempfile.new('lastUser')
    temp_file << userName
    temp_file.flush

    require 'fileutils'
    FileUtils.mv(temp_file.path, ACTIVE_USER_FILE_NAME)

    temp_file.close
    temp_file.unlink #delete file
  end

  def putsLastActiveUserJson
    name = open(ACTIVE_USER_FILE_NAME).read
    print '{"name":"' + name + '"}'
  end

  private
  def strArrayToJson a
    r = '['
    a.each_with_index do |str, i|
      r += '"' + str + '"';
      r += ',' if (i+1) != a.length #no comma after last element
    end
    r+=']'
  end
end



def testAddEvent
  api = AppApi.new
  api.putsCalenderJson 'zhao'
  api.addEvent('zhao', '1---3010 a3 due----', 'about js----', '2011/6/20')
  api.putsCalenderJson 'zhao'
end

#testAddEvent

def test
  api = AppApi.new
  api.putsCalenderJson 'zhao'
end

#test

def test2
  api = AppApi.new
  api.putsUsersJson
end

#test2

def testGetLastActiveUser
  api = AppApi.new
  p api.getLastActiveUser()
end

#testGetLastActiveUser

def testSetLastActiveUser
  api = AppApi.new
  api.setLastActiveUser "Zhao"

  testGetLastActiveUser
end

#testSetLastActiveUser

#app.addEvent('zhao', '3010 a3 due', 'about js', '2011/6/20')
#app.done

#app = App.new
#app.removeEvent('shuo', '3450')
#app.done
