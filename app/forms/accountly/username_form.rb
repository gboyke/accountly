module Accountly
  class UsernameForm
    include ActiveModel::Model

    attr_accessor :original_password, :new_username, :new_username_confirmation

    validate :verify_original_password, if: Proc.new { |u| u.original_password.present? }
    validates :original_password, presence: true
    validate :verify_unique_username

    validates :new_username, presence: true
    validates :new_username, length: { minimum: 5 }
    validates :new_username, confirmation: true


    def initialize(user)
      @user = user
    end

    def submit(params)
      self.original_password = params[:original_password]
      self.new_username = params[:new_username]
      self.new_username_confirmation = params[:new_username_confirmation]

      if valid?
        @user.username = new_username
        @user.save!
        true
      else
        false
      end
    end

    def verify_unique_username
      unless @user.confirmed_duplicate_username(self.new_username)
        errors.add :new_username, I18n.t('activemodel.errors.models.accountly/username_form.attributes.new_username.duplicate')
      end
    end

    def verify_original_password
      if @user.authenticate(original_password)
        true
      else
        errors.add :original_password, I18n.t('activemodel.errors.models.accountly/username_form.attributes.original_password.invalid')
        false
      end
    end
  end
end
