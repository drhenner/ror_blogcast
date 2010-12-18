# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  rescue_from Exception, :with => :render_500
  rescue_from ActionController::RoutingError, ActiveRecord::RecordNotFound, :with => :render_404 #Rails 3.0.1 doesn't work. 'Till 3.1.0
  #filter_parameter_logging :password, :password_confirmation # Scrub sensitive parameters from your log. Moved to config/application.rb
  helper_method :current_user
  layout proc{ |c| c.request.xhr? ? false : "application" } #Remove layouts for all ajax calls
  before_filter :instantiate_controller_and_action_names
  
  private
    def instantiate_controller_and_action_names
      @current_action = action_name
      @current_controller = controller_name
    end
  
    def render_500(exception = nil)
      if exception
        logger.info "Rendering 500 with exception: #{exception.message}"
      end

      render :file => "#{Rails.root}/public/500.html", :status => 500, :layout => false
    end
    
    def render_404(exception = nil)
      if exception
        logger.info "Rendering 404 with exception: #{exception.message}"
      end
      
      render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false
    end
    
    def current_user_session
      return @current_user_session if defined?(@current_user_session)
      @current_user_session = UserSession.find
    end
    
    def current_user
      return @current_user if defined?(@current_user)
      @current_user = current_user_session && current_user_session.record
    end
    
    def require_user
      unless current_user
        store_location
        render_404
        return false
      end
    end

    def require_no_user
      if current_user
        store_location
        redirect_to users_url
        return false
      end
    end
    
    def store_location
      session[:return_to] = request.url
    end
    
    def redirect_back_or_default(default)
      redirect_to(session[:return_to] || default)
      session[:return_to] = nil
    end
end