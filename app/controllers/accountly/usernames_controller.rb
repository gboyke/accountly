#
# usecase: if user wants to change his username when he is logged in.
#          he needs his current password to change it.
#

module Accountly
  class UsernamesController < AccountController

    def new
      @username_form = UsernameForm.new(current_user)
    end

    def create
      @username_form = UsernameForm.new(current_user)
      if @username_form.submit( params[:username_form] )
        redirect_to settings_url, notice: t('.notice.success')
      else
        render "new"
      end
    end
  end
end
