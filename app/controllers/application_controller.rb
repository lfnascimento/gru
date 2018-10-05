require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder

  protect_from_forgery with: :exception

  respond_to :html
  responders :flash

  protected

  def new_session_path(scope)
    new_user_session_path
  end
end
