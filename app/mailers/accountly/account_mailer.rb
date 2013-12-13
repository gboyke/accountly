module Accountly
  class AccountMailer < ActionMailer::Base

    helper :application

    default :from => APP_CONFIG['registration_mailer']['from']

    def new_email_request( user )
      @user = user
      @confirmation_url = confirm_new_email_url( @user.new_email_token )
      mail( :to => @user.new_email, :subject => t( '.subject' ))
    end
  end
end
