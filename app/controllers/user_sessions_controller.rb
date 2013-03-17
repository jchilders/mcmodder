# To get access to user session from console:
#
# > Authlogic::Session::Base.controller = Authlogic::ControllerAdapters::RailsAdapter.new(self)
# => #<Authlogic::ControllerAdapters::RailsAdapter:0x007fe1751700f8 @controller=main>
# > us = UserSession.new(:email => "validemail@domain.com", :password => "password")
#
class UserSessionsController < ApplicationController
  # before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => [:show, :logout]
  
  def index
    @user_session = UserSession.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user_session }
    end
  end

  def show
    redirect_to user_sessions_url
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = "Login successful"
      redirect_back_or_default uploads_url
    else
      flash[:notice] = "Failed"
      render :action => :index
    end
  end
  
  def logout
    current_user_session.destroy
    flash[:notice] = "Logged out"
    redirect_back_or_default new_user_session_url
  end
end
