#!/usr/bin/ruby

require './mycgi.rb'
require './AppApi.rb'

#iamJson
iamHtml

def main

  if METHOD == 'GET'
    input = qs2hash(Q_STR)
    user = input['user']

    api = AppApi.new
    api.putsCalenderJson(user)

  elsif METHOD == 'POST'
    input = unescapeFormInput STDIN.read
    input = qs2hash(input)

    user, name, desc, date = input["user"], input["name"], input["desc"], input["date"]
    if(user && name && desc && date)
      api = AppApi.new
      api.addEvent(user, name, desc, date)
      puts "input: "; p input
    end
    
  elsif METHOD == "DELETE"
    input = unescapeFormInput STDIN.read
    input = qs2hash(input)

    user, eventLine = input['user'], input['eventLine']
    if(user && eventLine)
      api = AppApi.new
      api.removeEvent(user, eventLine);
    end
  end
end

main
