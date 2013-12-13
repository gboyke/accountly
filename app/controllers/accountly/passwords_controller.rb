#
# usecase: if user wants to change his password when he is logged in.
#          he needs his current password to change it.
#
module Accountly
  class PasswordsController < AccountController
    def new
      @password_form = PasswordForm.new(current_user)
    end

    def create
      @password_form = PasswordForm.new(current_user)
      if @password_form.submit( params[:password_form] )
        redirect_to settings_url, notice: t('.notice.success')
      else
        render "new"
      end
    end
  end
end
