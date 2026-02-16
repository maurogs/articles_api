module Api
  class ApiController < ActionController::API
    include ::Api::Concerns::Response
  end
end
