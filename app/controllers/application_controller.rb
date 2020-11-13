class ApplicationController < ActionController::Base
    helper_method :current_user
    helper_method :logged_in?
    helper_method :review_creator
    
    
      def log_in(user)
        session[:user_id] = user.id
      end
    
      def current_user
        @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
      end
    
      def logged_in?
        !!current_user
      end
    
      def redirect_if_not_logged_in
        redirect_to login_path if !logged_in?
      end

      def review_creator(created)
        created.user == current_user
      end
end
