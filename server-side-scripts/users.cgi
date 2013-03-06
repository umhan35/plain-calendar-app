#!/usr/bin/ruby

require './mycgi.rb'
require './AppApi.rb'

iamHtml

def main
  api = AppApi.new

  if METHOD == 'GET'
    api.putsUsersJson if Q_STR == ''
    api.putsLastActiveUserJson if Q_STR == 'lastActiveUser'

  elsif METHOD == 'POST'
    input = unescapeFormInput STDIN.read
    input = qs2hash(input)

    lastActiveUser = input['lastActiveUser']
    if lastActiveUser
      api = AppApi.new
      api.setLastActiveUser lastActiveUser
    end
  end
end

main
