require 'test/unit'
require './mycgi.rb'

class Tests < Test::Unit::TestCase
  def testMethodQs2hash
    h = qs2hash('user=zhao')
    assert_equal Hash, h.class
    assert_equal 'zhao', h['user']
  end
end