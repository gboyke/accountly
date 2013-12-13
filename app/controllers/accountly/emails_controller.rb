module Accountly
  class EmailsController < AccountController
    def new
      @change_email_form = ChangeEmailForm.new(current_user)
    end

    def create
      @change_email_form = ChangeEmailForm.new(current_user)
      if @change_email_form.submit( params[:change_email_form] )
        redirect_to settings_url, notice: t( ".flash.success" )
      else
        render "new"
      end
    end
  end
end
