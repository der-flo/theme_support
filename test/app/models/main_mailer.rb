class MainMailer < ActionMailer::Base
  theme 'default'
  layout 'email'
  
  def simple from, to, moment
    from from
    recipients to
    subject 'subject'
    sent_on moment
  end
end
