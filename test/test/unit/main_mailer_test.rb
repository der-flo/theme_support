require 'test_helper'

class MainMailerTest < ActionMailer::TestCase  
  tests MainMailer
  
  test "should replace view and layout" do
    @expected.from = 'me@example.com'
    @expected.to = 'friend@example.com'
    @expected.subject = 'subject'
    @expected.body = read_fixture('simple')
    @expected.date = Time.now
    
    x = MainMailer.create_simple('me@example.com', 'friend@example.com', @expected.date).encoded
    assert_equal @expected.encoded, x
  end
  
end
