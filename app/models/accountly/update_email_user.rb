module Accountly
  module UpdateEmailUser

    def confirm_new_email!
      update_attribute(:email, new_email)
      update_attribute(:new_email_token, nil)
    end

    def send_new_email_request
      return unless (confirmed? && generate_token(:new_email_token))
      AccountMailer.send(:new_email_request, self).deliver
    end

    private

    def generate_token( token )
      (defined?( token ) && update_attribute( token, SecureRandom.hex(13) ))? true : false
    end
  end
end
