# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  include SessionsHelper
  
  
  
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  def authorize
    unless signin?
      flash[:error] = "Not authorized to access this page."
      redirect_to root_url
    end
  end
  
  
  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
end
