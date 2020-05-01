module SessionsHelper

	def current_customer
    @current_customer ||= Customer.find(session[:customer_id]) if session[:customer_id]
  end

	def logged_in?
    !!current_customer
  end

	def require_customer
    if !logged_in?
      flash[:danger] = "Not logged to perform that action"
      redirect_to root_path
    end
  end

end
