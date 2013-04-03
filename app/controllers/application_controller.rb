class ApplicationController < ActionController::Base
  protect_from_forgery
  include UrlHelper

  def after_sign_in_path_for(resource)
   edit_place_path(resource)
  end

  def current_place
    Place.find_by_subdomain! request.subdomain
  end
  helper_method :current_place
end
