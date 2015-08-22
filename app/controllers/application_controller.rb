class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }
  before_action :authenticate_user!
  #protect_from_forgery# with: :null_session
  #before_action :authenticate_user!
  after_filter :set_csrf_cookie_for_ng

  protected

  def set_csrf_cookie_for_ng
    cookies['XSRF-TOKEN'] = form_authenticity_token if protect_against_forgery?
  end

  def verified_request?
    super || valid_authenticity_token?(session, request.headers['X-XSRF-TOKEN'])
  end

  def after_sign_in_path_for(resource)
    session[:previous_url] || welcome_index_path || root_path
  end

  def current_user
    User.first
  end

end
