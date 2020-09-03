class Api::V1::ComediansController < ApplicationController
  def index
    # require "pry"; binding.pry
    render json: Comedian.all
  end
end
