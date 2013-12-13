module Accountly
  class ConfirmationController < ApplicationController

    def new_email
      @user = User.find_by_new_email_token( params[:token] ) unless params[:token].nil?
      if @user
        if @user.confirm_new_email!
          redirect_to( root_url, :notice => t( '.flash.success' ))
        else
          flash[:notice] = t( '.flash.error' )
        end
      else
        render :new_email_token
      end
    end

  end
end
