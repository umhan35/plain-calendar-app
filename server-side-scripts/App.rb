require './AppReadOnly.rb'

class App < AppReadOnly

  def initialize(fileName = '../data/data.txt')
    super(fileName)
  end

  def addEvent(userName, eventName, eventDesc, eventDate)
    super(userName, eventName, eventDesc, eventDate)
    modifyFile
  end

  def removeEvent(userName, event)
    super(userName, event)
    modifyFile
  end

  private
  
  def modifyFile
    require 'tempfile'

    temp_file = Tempfile.new('changedCalender')
    lines do |line, lineNum|
      if calenderLineNum? lineNum
        temp_file.puts getCalenderFileFormat()
#          print "old line: #{lineNum}";p line
#          print "new line: #{lineNum}";p getCalenderFileFormat()
      else
        temp_file.puts  line
#          print "old line: #{lineNum}";p line
      end
    end
    temp_file.flush

    require 'fileutils'
    FileUtils.mv(temp_file.path, @fileName)

    temp_file.close
    temp_file.unlink #delete file
  end

end
