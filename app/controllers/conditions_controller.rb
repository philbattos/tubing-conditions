require "open-uri"

class ConditionsController < ApplicationController

  def index
    response = URI.parse(ENV['TUBING_CONDITIONS_URL']).read
    @current_conditions = Conditions.new(JSON.parse(response))
  rescue => error
    Rails.logger.info "*** Something went wrong with the Tubing Conditions API: #{error}"
    redirect_to "/", status: 422
  end

end
