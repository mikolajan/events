class ApplicationMailer < ActionMailer::Base
  default from: ENV['EMAIL_FOR_MAILER']

  layout 'mailer'
end
