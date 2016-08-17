class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  before_action do
    Rails.logger.info("Headers:")

    http_request_headers = request.headers.select do |key, val|
      key.match("^(HTTP|CONTENT|REMOTE|SERVER)")
    end

    http_request_headers.sort.each do |name, val|
      Rails.logger.info("  #{name}: #{val}")
    end
  end
end
