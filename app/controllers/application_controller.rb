class ApplicationController < ActionController::Base
  protect_from_forgery
  include UrlHelper

  def current_place
    Place.find_by_subdomain! request.subdomain
  end
  helper_method :current_place
end
