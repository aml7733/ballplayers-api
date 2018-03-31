class ApplicationController < ActionController::API
  def not_found
    raise ActiveRecord::RecordNotFound.new('Resource Not Found')
  end
end
