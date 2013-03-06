def qs2hash(qs)
  pms = {}
  qs.split('&').each do |i|
    p = i.split('=')
    pms[p[0]] = p[1]
  end
  pms
end

def unescapeFormInput(string)
  str=string.tr('+', ' ').gsub(/((?:%[0-9a-fA-F]{2})+)/) do
    [$1.delete('%')].pack('H*')
  end
  str
end

def iamHtml
  puts 'Content-type: text/html'
  puts
end

def iamJson
  puts 'Content-type: application/json'
  puts
end

METHOD = ENV['REQUEST_METHOD']
Q_STR = ENV['QUERY_STRING']
