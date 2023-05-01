class ApplicationController < ActionController::Base
  protect_from_forgery prepend: true, with: :exception

  private
end
