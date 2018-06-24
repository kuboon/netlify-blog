class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include RestfulError::ActionController
  rescue_from StandardError do |ex|
    render_exception ex
  end

  before_action do
    @ogp = {}
  end

  def honey
    session[:honey_flash] ||= []
  end
  def honey_flash
    session.delete(:honey_flash)
  end
  helper_method :honey_flash

end
