class Api::V1::ComediansController < ApplicationController
  def index
    comedians = Comedian.all
    render json: ComedianSerializer.new(comedians)
  end
end
