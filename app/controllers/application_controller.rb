class ApplicationController < ActionController::Base
  protect_from_forgery

  MC_JAR = "#{Rails.root}/public/minecraft.jar"
end
