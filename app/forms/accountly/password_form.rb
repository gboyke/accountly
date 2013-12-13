module Accountly
  class PasswordForm
    include ActiveModel::Model

    attr_accessor :original_password, :new_password

    validate :verify_original_password
    validates :original_password, presence: true

    validates :new_password, length: { minimum: 5 }
    validates :new_password, confirmation: true


    def initialize(user)
      @user = user
    end

    def submit(params)
      self.original_password = params[:original_password]
      self.new_password = params[:new_password]
      self.new_password_confirmation = params[:new_password_confirmation]

      if valid?
        @user.password = new_password
        @user.password_confirmation = new_password_confirmation
        @user.save!
        true
      else
        false
      end
    end

    def verify_original_password
      if @user.authenticate(original_password)
        true
      else
        errors.add :original_password, I18n.t('activemodel.errors.models.accountly/password_form.attributes.original_password.invalid')
        false
      end
    end
  end
end
