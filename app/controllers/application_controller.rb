class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  def homepage
    render html: "Welcome to HYHYH! -- A community to watch interesting videos together!"
  end
  
end
