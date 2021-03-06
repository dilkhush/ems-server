class API::BaseController < ApplicationController

  def custom_authenticate_user!
    authenticate_or_request_with_http_token do |token, options|
      @current_user = User.find_by(authentication_token: token)
    end
  end

end
