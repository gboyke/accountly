module Accountly
  class ChangeEmailForm
    include ActiveModel::Model

    attr_accessor :password, :new_email, :new_email_confirmation

    validate :verify_password
    validate :validate_steps_email

    def initialize(user)
      @user = user
    end

    def submit(params)
      self.password = params[:password]
      self.new_email = params[:new_email]
      self.new_email_confirmation = params[:new_email_confirmation]
      if valid?
        @user.new_email = new_email
        @user.save!
        @user.send_new_email_request
        true
      else
        false
      end
    end

    def validate_steps_email

      if new_email.present?
        if new_email =~ EMAIL_REGEX
          if @user.confirmed_duplicate_email(self.new_email)
            if new_email_confirmation.present?
              if new_email_confirmation == new_email
                true
              else
                error_add :new_email_confirmation, 'confirmation'
                false
              end
            else
              error_add :new_email_confirmation, 'blank'
              false
            end
          else
            error_add :new_email, 'duplicate'
          end
        else
          error_add :new_email, 'invalid'
          false
        end
      else
        error_add :new_email, 'blank'
        false
      end
    end

    def verify_password
      if password.blank?
        error_add :password, 'blank'
      else
        unless @user.authenticate(password)
          error_add :password, 'invalid'
        end
      end
    end

    def error_add(attribute, error)
      errors.add attribute, I18n.t("activemodel.errors.models.accountly/change_email_form.attributes.#{attribute}.#{error}")
    end
  end
end
