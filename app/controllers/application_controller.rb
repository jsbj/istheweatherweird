class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :init_mixpanel

  def init_mixpanel
	  @tracker = Mixpanel::Tracker.new("73d5b1f1bee48b4fcc119119c45f45c5")
  end
end
